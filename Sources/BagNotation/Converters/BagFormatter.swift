//
//  BagFormatter.swift
//  Bag Notation
//

import Foundation
import SwiftTreeSitter

// TODO: possibly rename to BagWriter

public struct BagFormatter {
    let source: String

    public init(_ source: String) { self.source = source }

    public func modifiedRanges() throws -> [SpaceBlock] {
        // TODO: add hints for "voice line indexes" and "voices with pickups"
//        let doc = try BagReader(source).makeModel()

        let groups = source
            .split(separator: "\n\n")
            // TODO: middle line could be whitespace only? maybe takes two formatting passes, first removing trailng whitespace. test case for this.
            // While re-working spaceblock to act on TSRanges, just get all the spaceblocks for the whole file.
            // Then group and sort them by consecutive line indexes.
            // Filter on the type of line
            .map {
                FormatGroup($0
                    .split(separator: "\n")
                    .filter {
                        $0.contains("|")
                    }
                )
            }

        return groups.flatMap(\.spaceBlocks)
    }

    public func formattedSource() throws -> String {
        let ranges = try modifiedRanges()

        return try ranges.reversed().reduce(source) { formatted, range -> String in
            guard range.newWidth != range.origWidth else { return formatted }
            guard formatted[range.origStart ..< range.origEnd].trimmingCharacters(in: .whitespaces).isEmpty else { throw FormattingError.rangeIsNotWhitespace }
            let padding = String(Array(repeating: " ", count: range.newWidth))
            return formatted.replacingCharacters(in: range.origStart ..< range.origEnd, with: padding)
        }
    }
}

enum FormattingError: Error {
    case rangeIsNotWhitespace
}

// TODO: adjust newlines to be header, blank, body, blank, blank, header, blank, body, (trailing newline)

struct AlignmentGuide {
    let guideWidths: [SpaceBlock.Alignment: Int]

    init(guides: [SpaceBlock.Alignment: Int]) { guideWidths = guides }

    init(_ spaceBlocks: [SpaceBlock]) {
        var m = [SpaceBlock.Alignment: Int]()

        var currentWidth = 0
        for spaceBlock in spaceBlocks {
            currentWidth += spaceBlock.preceedingWidth
            currentWidth += spaceBlock.newWidth
            if let al = spaceBlock.alignmentColumn {
                m[al] = currentWidth
                currentWidth = 0
            }
        }

        // TODO: need to  set all items, or be just individual props
        guideWidths = m
    }

    static func maxPer(lhs: AlignmentGuide, rhs: AlignmentGuide) -> AlignmentGuide {
        AlignmentGuide(guides: lhs.guideWidths.merging(rhs.guideWidths, uniquingKeysWith: max))
    }

    func alignBlocks(_ spaceBlocks: inout [SpaceBlock]) {
        var currentWidth = 0
        for (idx, spaceBlock) in spaceBlocks.enumerated() {
            currentWidth += spaceBlock.preceedingWidth
            if let al = spaceBlock.alignmentColumn, let guide = guideWidths[al] {
                spaceBlocks[idx].newWidth = guide - currentWidth
                currentWidth = 0
            } else {
                currentWidth += spaceBlock.newWidth
            }
        }
    }
}

public struct SpaceBlock {
    let origStart: String.Index
    let origEnd: String.Index
    let origWidth: Int
    let preceedingWidth: Int
    var newWidth: Int = 1

    enum Alignment: Hashable {
        case leadingBarline
        case pickupBarline
        case firstTrueNote
        case barline(index: Int)
    }

    var alignmentColumn: Alignment?
}

func allSpaceBlocks(in str: any StringProtocol) -> [SpaceBlock] {
    // StringProtocol doesn't have regexes, and converting to
    // String won't retain the relative indexes into the full string

    var blocks = [SpaceBlock]()
    var activeStart: String.Index?
    var width = 0
    var preceedingWidth = 0
    for idx in str.indices {
        let char = str[idx]
        if activeStart == nil {
            if char.isWhitespace {
                activeStart = idx
                preceedingWidth = width
                width = 1
            } else {
                width += 1
            }
        } else {
            if char.isWhitespace {
                width += 1
            } else {
                blocks.append(SpaceBlock(origStart: activeStart!, origEnd: idx, origWidth: width, preceedingWidth: preceedingWidth))
                activeStart = nil
                width = 0
            }
        }
    }

    if let activeStart {
        blocks.append(SpaceBlock(origStart: activeStart, origEnd: str.endIndex, origWidth: width, preceedingWidth: preceedingWidth))
    }

    return blocks
}

// TODO: add spaces near barlines
// TODO: remove spaces inside and touching field parens; leading label colons

struct FormatGroup {
    var lines: [[SpaceBlock]]
    let alignmentGuide: AlignmentGuide
    var spaceBlocks: [SpaceBlock] { lines.flatMap { $0 }}

    init(_ lines: [String.SubSequence]) {
        self.lines = lines.map { str in
            var spaceBlocks = allSpaceBlocks(in: str)

            // TODO: align something before first block? snap to front? if stuff is before notes

            var barlineIndex = 0
            var foundNotesYet = false

            for idx in 1 ..< spaceBlocks.count {
                let interStr = str[spaceBlocks[idx - 1].origEnd ..< spaceBlocks[idx].origStart]
                // TODO: consider leading fields, spaces, etc
                if !foundNotesYet && interStr.contains("x") { // TODO: better regex
                    foundNotesYet = true
                    spaceBlocks[idx - 1].alignmentColumn = .firstTrueNote
                } else if interStr.contains("|") { // TODO: do better here. try! Regex("[|:]+") or CharacterSet(["|",":"])
                    spaceBlocks[idx - 1].alignmentColumn = .barline(index: barlineIndex)
                    barlineIndex += 1
                }
            }

            // trailing barline
            spaceBlocks[spaceBlocks.count - 1].alignmentColumn = .barline(index: barlineIndex)

            // TODO: consider and remove trailing whitespace, if any after the final barline
            return spaceBlocks
        }
        alignmentGuide = self.lines.map(AlignmentGuide.init).reduce(AlignmentGuide([]), AlignmentGuide.maxPer)
        for idx in 0 ..< self.lines.count {
            alignmentGuide.alignBlocks(&self.lines[idx])
        }
    }
}
