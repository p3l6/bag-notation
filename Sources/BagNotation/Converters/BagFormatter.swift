//
//  BagFormatter.swift
//  Bag Notation
//

import Foundation
import SwiftTreeSitter

public struct BagFormatter {
    let source: String
    let tree: BagTree

    public init(_ source: String) { 
        self.source = source
        tree = BagTree(source)
    }

    public func modifiedRanges() throws -> [ModifiedRange] {
        let treeMatches = try tree.executeQuery(BagTree.formattingQuery)

        var alignmentBlocks: [Block] = []
        var barlineRanges: [InlineRange] = []

        for x in treeMatches {
            var column = 0
            var barCount = 0
            var pickupAlreadyFound = false
            let markers = x.captures.sorted { a, b in
                a.node.pointRange.lowerBound.column < b.node.pointRange.lowerBound.column
            }

            var pendingLeadingField: InlineRange? = nil
            for m in markers {
                let markerRange = m.node.inlineRange
                switch m.nameComponents.first! {
                case "leadingField":
                    pendingLeadingField = InlineRange(line: markerRange.line, lowerBound: column, upperBound: markerRange.upperBound)
                case "leadingBarline":
                    let range = InlineRange(line: markerRange.line, lowerBound: column, upperBound: markerRange.upperBound)
                    alignmentBlocks.append(Block(type: .leading, range: range, textProvider: tree, paddingHint: pendingLeadingField == nil ? .absoluteStart : .lastFlex))
                    barlineRanges.append(markerRange)
                    column = markerRange.upperBound
                    pendingLeadingField = nil
                case "normalBarline":
                    if let range = pendingLeadingField {
                        // This is a leading field, but without a leading barline
                        alignmentBlocks.append(Block(type: .leading, range: range, textProvider: tree, paddingHint: .absoluteEnd))
                        column = range.upperBound
                        pendingLeadingField = nil
                    }
                    let range = InlineRange(line: markerRange.line, lowerBound: column, upperBound: markerRange.upperBound)
                    let pickup = barCount == 0 && !pickupAlreadyFound && isLikelyPickup(node: m.node)
                    let type: Block.BlockType = pickup ? .pickup : .bar(index: barCount)
                    alignmentBlocks.append(Block(type: type, range: range, textProvider: tree, paddingHint: pickup ? .absoluteStart : .lastFlex))
                    barlineRanges.append(markerRange)
                    if !pickup { barCount += 1 } else {pickupAlreadyFound = true}
                    column = markerRange.upperBound
                default: throw FormattingError.unexpectedCaptureType
                }
            }
        }

        let canonicalModifications = try barlineRanges.compactMap { range in
            switch tree.text(for: range) {
            case "i": try ModifiedRange(range: range, replacement: .canonicalBarline(type: .plain))
            case "i:": try ModifiedRange(range: range, replacement: .canonicalBarline(type: .repeatStart))
            case ":i": try ModifiedRange(range: range, replacement: .canonicalBarline(type: .repeatEnd))
            case "ii", "|i", "i|": try ModifiedRange(range: range, replacement: .canonicalBarline(type: .double))
            default: nil
            }
        }

        let groups = FormatGroup.groups(from: alignmentBlocks)
        let alignmentModifications = try groups.flatMap { try $0.modifications() }

        return (alignmentModifications + canonicalModifications).sorted()
    }

    public func formattedSource() throws -> String {
        let ranges = try modifiedRanges()

        return try ranges.reversed().reduce(source) { formatted, mod -> String in
            let indexes = tree.stringIndexes(for: mod.range)
            if case .spaces = mod.replacement, !formatted[indexes].trimmingCharacters(in: .whitespaces).isEmpty { throw FormattingError.rangeIsNotWhitespace }
            return formatted.replacingCharacters(in: indexes, with: mod.newText)
        }
    }
}

private func isLikelyPickup(node barlineNode: Node) -> Bool {
    // TODO: if it fully compiles, add hint for "voices with pickups"
    let barNode = barlineNode.parent!
    let voiceNode = barNode.parent!
    let clusters = (0 ..< barNode.childCount).count { barNode.child(at:$0)?.nodeType == NodeType.cluster.rawValue }
    let bars = (0 ..< voiceNode.childCount).count { voiceNode.child(at:$0)?.nodeType == NodeType.bar.rawValue }
    return clusters <= 1 && bars > 4
}

enum FormattingError: Error {
    case unexpectedCaptureType
    case unexpectedCapturePattern
    case rangeIsNotWhitespace
    case negativeWidth
}

struct Block {
    enum BlockType: Hashable, Comparable {
        case leading
        case pickup
        case bar(index: Int)
    }

    enum PaddingHint {
        case absoluteStart
        case lastFlex
        // TODO: afterColumn(index: Int)
        case absoluteEnd
    }

    let type: BlockType
    let range: InlineRange
    let text: String
    let flexibleRanges: [InlineRange]
    let idealWidth: Int
    let paddingHint: PaddingHint

    init(type: BlockType, range: InlineRange, textProvider: NodeSourceTextProvider, paddingHint: PaddingHint) {
        self.type = type
        self.range = range
        self.paddingHint = paddingHint
        let text = textProvider.text(for: range)
        self.text = text

        let spaces = try! text.ranges(of: Regex(" +"))
        flexibleRanges = spaces
            .map{ $0.lowerBound.utf16Offset(in: text)  ..< $0.upperBound.utf16Offset(in: text) }
            .map{ range.rangeFor(relativeRange: $0) }

        idealWidth = flexibleRanges.reduce(text.count) { fullWidth, flex in fullWidth - (flex.width - 1) }
    }

    var originalWidth: Int { text.count }

    func modifications(for ideal: AlignmentGuide, actualStartCol: Int) throws -> [ModifiedRange] {
        // TODO: this function is a bit long and could use some simplification refactors
        let idealRange = ideal.range(of: type)
        let target = idealRange.upperBound
        let extraPadding = target - (actualStartCol + idealWidth)

        var flexes = flexibleRanges
        var leadingFlex =  InlineRange(line: range.line, lowerBound: range.lowerBound, upperBound: range.lowerBound)
        if let first = flexes.first, first.lowerBound == range.lowerBound {
            leadingFlex = flexes.removeFirst()
        }
        var trailingFlex = InlineRange(line: range.line, lowerBound: range.upperBound, upperBound: range.upperBound)
        if let last = flexes.last, last.upperBound == range.upperBound {
            trailingFlex = flexes.removeLast()
        }

        let midFlex = flexes.isEmpty ? nil : flexes.removeLast()

        var modifications = try flexes.compactMap { flex in
            try ModifiedRange(range: flex, replacement: .spaces(count: 1))
        }

        // TODO: test case where bar0 is longer than the pickup line pushing it out

        var leadingSize = if paddingHint == .absoluteStart { extraPadding + (leadingFlex.width == 0 ? 0 : 1)}
        else if paddingHint == .lastFlex && midFlex == nil { extraPadding + (leadingFlex.width == 0 ? 0 : 1) }
        else if leadingFlex.width == 0 { 0 }
        else { 1 }

        let trailingSize = if paddingHint == .absoluteEnd {extraPadding + (trailingFlex.width == 0 ? 0 : 1) }
        else if trailingFlex.width == 0 { 0 }
        else { 1 }

        var midSize = if paddingHint == .lastFlex { extraPadding + 1}
        else { 1 }

        switch type {
        case .bar(index: 0):
            var shift = idealRange.lowerBound - actualStartCol
            if leadingSize == 0 && idealRange.lowerBound != 0 { shift += 1 }
            guard shift >= 0 else { throw FormattingError.negativeWidth }
            if shift > 0 {
                leadingSize += shift
                midSize -= shift
            }
        case .bar:
            if leadingSize == 0 {
                leadingSize += 1
                midSize -= 1
            }
        default: break
        }

        if let mod = try ModifiedRange(range: leadingFlex, replacement: .spaces(count: leadingSize)) {
            modifications.append(mod)
        }

        if let midFlex, let mod = try ModifiedRange(range: midFlex, replacement: .spaces(count: midSize)) {
            modifications.append(mod)
        } 

        if let mod = try ModifiedRange(range: trailingFlex, replacement: .spaces(count: trailingSize)) {
            modifications.append(mod)
        }

        return modifications
    }

}

struct FormatGroup {
    struct Line {
        let blocks: [Block]
        let index: Int
        let guide: AlignmentGuide

        init(blocks: [Block], index: Int) {
            self.index = index
            self.blocks = blocks.sorted(by: { $0.type < $1.type }) 
            self.guide = blocks.reduce(into: AlignmentGuide()) { $0.require(width: $1.idealWidth, for: $1.type)}
        }

        func modifications(for ideal: AlignmentGuide) throws -> [ModifiedRange] {
            var totalDiffs = 0
            return try blocks.flatMap {
                let column = $0.range.lowerBound + totalDiffs
                let mods = try $0.modifications(for: ideal, actualStartCol: column)
                totalDiffs += mods.reduce(0, { $0 + $1.diff })
                return mods
            }
        }
    }
    var lines = [Line]()
    private var indexes =   Set<Int>()
    var ideal  = AlignmentGuide()

    func modifications() throws -> [ModifiedRange] {
        try lines.flatMap { try $0.modifications(for: ideal) }
    }

    private func acceptsLine(_ line: Line) -> Bool {
        indexes.count == 0 || indexes.contains(line.index)
    }

    private mutating func addLine(_ line: Line) {
        lines.append(line)
        indexes.formUnion([line.index-1, line.index, line.index+1])
        ideal.merge(line.guide)
    }

    static func groups(from blocks: [Block]) -> [FormatGroup] {
        let lines = Dictionary(grouping: blocks, by: { $0.range.line })
            .map { (key, value) in
                Line(blocks: value, index: Int(key))
            }
            .sorted() { $0.index < $1.index }

        var groups = [FormatGroup]()
        var group = FormatGroup()
        for line in lines {
            if !group.acceptsLine(line) {
                groups.append(group)
                group = FormatGroup()
            }
            group.addLine(line)
        }
        if group.lines.count != 0 { groups.append(group) }
        return groups
    }
}

struct AlignmentGuide {
    // (h) || xxh | th+ vhe xxcza | xxh+ th+
    // ^----^^----^^-----bar------^^-----bar--...
    //  |      pickup
    //  leading

    private var widths = [Block.BlockType: Int]()
    private var ranges: [Block.BlockType: Range<Int>] = [:]

    mutating func require(width: Int, for block: Block.BlockType) {
        if widths[block] == nil || widths[block]! < width {
            widths[block] = width
            rebuildRanges()
        }
    }

    func range(of block: Block.BlockType) -> Range<Int> {
        return ranges[block]! // TODO: handle error here
    }

    private mutating func rebuildRanges() {
        ranges = [:]
        var col = 0
        for (block, width) in widths.sorted(by: { $0.key < $1.key }) {
            ranges[block] = col ..< col + width
            col += width
        }
    }

    mutating func merge(_ other: AlignmentGuide) {
        for (block, width) in other.widths {
            require(width: width, for: block)
        }
    }
}

public struct ModifiedRange: CustomStringConvertible, Comparable {
    enum Replacement {
        case spaces(count: Int)
        case canonicalBarline(type: Barline)
    }

    let range: InlineRange
    let replacement: Replacement
    
    init?(range: InlineRange, replacement: Replacement) throws {
        if case let .spaces(count) = replacement, count == range.width { return nil }
        if case let .spaces(count) = replacement, count <= 0 { throw FormattingError.negativeWidth }

        self.range = range
        self.replacement = replacement
    }

    var newText: String {
        switch replacement {
        case let .spaces(count): String(Array(repeating: " ", count: count))
        case .canonicalBarline(.plain): "|"
        case .canonicalBarline(.repeatStart): "|:"
        case .canonicalBarline(.repeatEnd): ":|"
        case .canonicalBarline(.partStart),
             .canonicalBarline(.partEnd),
             .canonicalBarline(.double): "||"
        }
    }

    var diff: Int {
        switch replacement {
        case let .spaces(count): count - Int(range.upperBound - range.lowerBound)
        case .canonicalBarline: 0
        }
    }

    public var description: String {
        "\(range) => \(diff) => \(replacement)"
    }

    public static func < (lhs: ModifiedRange, rhs: ModifiedRange) -> Bool {
        // only sorts on lower bound, we shouldn't have overlapping replacements
        if lhs.range.line == rhs.range.line {
            lhs.range.lowerBound < rhs.range.lowerBound
        } else {
            lhs.range.line < rhs.range.line
        }
    }

    public static func == (lhs: ModifiedRange, rhs: ModifiedRange) -> Bool {
        lhs.range.line == rhs.range.line
        && lhs.range.lowerBound == rhs.range.lowerBound
    }
}


// TODO: add spaces near barlines
// TODO: remove spaces inside and touching field parens; leading label colons
// TODO: consider and remove trailing whitespace, if any after the final barline
// TODO: adjust newlines to be header, blank, body, blank, blank, header, blank, body, (trailing newline)
