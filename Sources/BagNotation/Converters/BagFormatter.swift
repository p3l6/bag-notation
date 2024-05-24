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
        // TODO: if it fully compiles, add hint for "voices with pickups"

        let treeMatches = try tree.executeQuery(BagTree.formattingQuery)

        let matches = try treeMatches.flatMap { x in
            var column = 0
            var barCount = 0
            let markers = x.captures.sorted { a, b in
                a.node.pointRange.lowerBound.column < b.node.pointRange.lowerBound.column
            }

            var items = [Block]()
            for m in markers {
                let markerRange = m.node.inlineRange
                let range = InlineRange(line: markerRange.line, lowerBound: column, upperBound: markerRange.upperBound)
                switch m.nameComponents.first! {
                case "leadingField":
                    items.append(Block(type: .leadingField, range: range, textProvider: tree))
                    column = markerRange.upperBound + 2 //TODO: wierd plus two here, for trailing paren. probs wont work
                case "leadingBarline":
                    items.append(Block(type: .leadingBarline, range: range, textProvider: tree))
                    column = markerRange.upperBound
                case "firstNote":
                    let range = InlineRange(line: markerRange.line, lowerBound: column, upperBound: markerRange.lowerBound)
                    items.append(Block(type: .firstNote, range: range, textProvider: tree))
                    column = markerRange.lowerBound
                case "normalBarline":
                    items.append(Block(type: .bar(index: barCount), range: range, textProvider: tree))
                    barCount += 1
                    column = markerRange.upperBound
                default: throw FormattingError.unexpectedCaptureType
                }
            }
            return items
        }


        let groups = FormatGroup.groups(from: matches)
        print(groups.first!.ideal)
        return try groups.flatMap{try $0.modifications()}.sorted()
    }

    public func formattedSource() throws -> String {
        let ranges = try modifiedRanges()

        return try ranges.reversed().reduce(source) { formatted, mod -> String in
            let indexes = tree.stringIndexes(for: mod.range)
            guard formatted[indexes].trimmingCharacters(in: .whitespaces).isEmpty else { throw FormattingError.rangeIsNotWhitespace }
            return formatted.replacingCharacters(in: indexes, with: mod.newText)
        }
    }
}

enum FormattingError: Error {
    case unexpectedCaptureType
    case unexpectedCapturePattern
    case rangeIsNotWhitespace
    case negativeWidth
}

struct Block {
    enum BlockType: Hashable, Comparable {
        case leadingField
        case leadingBarline
        case pickup
        case firstNote
        case bar(index: Int)
    }

    let type: BlockType
    let range: InlineRange
    let text: String
    let flexibleRanges: [InlineRange]
    let idealWidth: Int

    init(type: BlockType, range: InlineRange, textProvider: NodeSourceTextProvider) {
        self.type = type
        self.range = range
        let text = textProvider.text(for: range)
        self.text = text

        let spaces = try! text.ranges(of: Regex(" +"))
        flexibleRanges = spaces
            .map{ $0.lowerBound.utf16Offset(in: text)  ..< $0.upperBound.utf16Offset(in: text) }
            .map{ range.rangeFor(relativeRange: $0) }

        idealWidth = flexibleRanges.reduce(text.count) { fullWidth, flex in fullWidth - (flex.width - 1) }
    }

    var originalWidth: Int { text.count }

    func modification(for ideal: AlignmentGuide, actualStartCol: Int) throws -> ModifiedRange? {
        let target = ideal.range(of: type).upperBound

        let difference = target - (actualStartCol + originalWidth)
        if difference != 0, let replaceRange = flexibleRanges.last  {
            let width = replaceRange.width + difference
            guard width > 0 else { throw FormattingError.negativeWidth }
            return ModifiedRange(range: replaceRange, replacement: .spaces(count: width))
        }
        return nil
    }

}

struct FormatGroup {
    struct Line {
        let blocks: [Block]
        let index: Int
        let guide: AlignmentGuide

        init(blocks: [Block], index: Int) {
            self.index = index
            self.blocks = blocks
            self.guide = blocks.reduce(into: AlignmentGuide()) { $0.require(width: $1.idealWidth, for: $1.type)}
        }

        func modifications(for ideal: AlignmentGuide) throws -> [ModifiedRange] {
            var totalDiffs = 0
            return try blocks.compactMap {
                let column = $0.range.lowerBound + totalDiffs
                let mod = try $0.modification(for: ideal, actualStartCol: column)
                totalDiffs += mod?.diff ?? 0
                return mod
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
        var group: FormatGroup! = nil
        for line in lines {
            if group == nil { group = FormatGroup() }
            if group.acceptsLine(line) {
                group.addLine(line)
            } else {
                groups.append(group)
                group = nil
            }
        }
        if group != nil { groups.append(group) }
        return groups
    }
}

struct AlignmentGuide {
    // (h) || xxh | th+ vhe xxcza | xxh+ th+
    // ^--^  ^----^^-----bar------^^-----bar--...
    //  |  ^^  |    ^-first true note
    //  |  |   pickup
    //  |  leading barline
    //  leading field

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
    }

    let range: InlineRange
    let replacement: Replacement

    var newText: String {
        switch replacement {
        case let .spaces(count): String(Array(repeating: " ", count: count))
        }
    }

    var diff: Int {
        switch replacement {
        case let .spaces(count): count - Int(range.upperBound - range.lowerBound)
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
// TODO: align something before first block? snap to front? if stuff is before notes
// TODO: consider and remove trailing whitespace, if any after the final barline
// TODO: adjust newlines to be header, blank, body, blank, blank, header, blank, body, (trailing newline)
