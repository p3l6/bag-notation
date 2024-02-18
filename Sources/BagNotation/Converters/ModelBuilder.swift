//
//  ModelBuilder.swift
//  Bag Notation
//

import os
import SwiftTreeSitter
import TreeSitterBagNotation

private let logger = Logger(subsystem: "BagNotation", category: "ModelBuilder")

public class ModelBuilder {
    let source: String
    private var cursor: TreeCursor!
    var context = Context()

    public init(_ source: String) { self.source = source }

    lazy var tree: Tree = {
        let language = Language(language: tree_sitter_BagNotation())
        let parser = Parser()
        try? parser.setLanguage(language)
        let tree = parser.parse(source)
        return tree!
    }()

    private func modelDebug(from node: Node) {
        let cur = node.treeCursor
        var indent = ""
        while let currentNode = cur.currentNode {
            if currentNode.childCount == 0 {
                print("\(indent)\(currentNode.nodeType!.trimmingCharacters(in: .whitespacesAndNewlines)) \(currentNode.pointRange) \(text(of: currentNode).trimmingCharacters(in: .whitespacesAndNewlines))")
            } else {
                print("\(indent)\(currentNode.nodeType!) \(currentNode.pointRange)")
            }
            if cur.goToFirstChild() {
                indent += " "
            } else {
                while !cur.gotoNextSibling() {
                    if cur.gotoParent() {
                        indent.removeLast()
                    } else {
                        return
                    }
                }
            }
        }
    }

    public func makeModel() throws -> Doc {
        // modelDebug(from: tree.rootNode!)
        cursor = tree.rootNode!.treeCursor
        return try docAtCursor()
    }

    private func text(at range: TSRange) -> String {
        let buf: [UInt16] = Array(source.utf16)
        let hmm = buf[Int(range.bytes.lowerBound / 2) ..< Int(range.bytes.upperBound / 2)]
        return String(utf16CodeUnits: Array(hmm), count: hmm.count)
    }

    private func text(of node: Node) -> String {
        text(at: node.tsRange)
    }

    private func childrenOfCursor() throws -> NodeChildren {
        var childs = NodeChildren()

        guard cursor.goToFirstChild() else { throw ModelParseError.nodeHasNoChildren }
        repeat {
            guard let currentNode = cursor.currentNode else { throw ModelParseError.cursorAtInvalidNode }
            guard currentNode.isNamed else { continue }
            switch currentNode.nodeType {
            case "tune": childs.tunes.append(try tuneAtCursor())
            case "line": childs.lines.append(try lineAtCursor())
            case "header": childs.header = try headerAtCursor()
            case "field", "inline_field":
                let field = try fieldAtCursor()
                if let label = field.label {
                    childs.labeledFields[label] = field.value
                } else {
                    childs.unlabeledFields.append(field.value)
                }
            case "body": childs.lines.append(contentsOf: try bodyAtCursor())
            case "measure": childs.bars.append(try barAtCursor())
            case "barline": childs.barlines.append(try barlineAtCursor())
            case "note_cluster": childs.noteClusters.append(try clusterAtCursor())
            case "note": childs.notes.append(try noteAtCursor())
            case "comment", "tail_comment": break
            case "ERROR": 
                logger.error("File could not be parsed at line \(currentNode.pointRange.lowerBound.row+1) col \(currentNode.pointRange.lowerBound.column/2)")
                throw ModelParseError.fileParseError
            default:
                logger.error("Unknown node type encountered: \(currentNode.nodeType!)")
                throw ModelParseError.unknownNodeType
            }
        } while cursor.gotoNextSibling()
        guard cursor.gotoParent() else { throw ModelParseError.cursorFailedToReturnToParent }

        return childs
    }

    private func expectCursor(is type: String) throws {
        guard let node = cursor.currentNode, node.nodeType == type else {
            logger.error("Incorrect node type: have \(self.cursor.currentNode?.nodeType ?? "nil") expected \(type)")
            throw ModelParseError.unexpectedNodeType
        }
    }

    // MARK: Nodes at cursor

    private func docAtCursor() throws -> Doc {
        try expectCursor(is: "file")
        return Doc(tunes: try childrenOfCursor().tunes)
    }

    private func tuneAtCursor() throws -> Tune {
        try expectCursor(is: "tune")
        context.tuneNumber += 1
        context.lineNumberInTune = 0
        let children = try childrenOfCursor()
        return Tune(header: children.header!,
                    lines: children.lines)
    }

    private func headerAtCursor() throws -> Header {
        try expectCursor(is: "header")

        let fields = try childrenOfCursor().labeledFields

        let titleLine = try fields["title"] ?! ModelParseError.tuneMissingTitle
        let titleParts = titleLine.split(separator: " by ").map(String.init)
        let byline: String? = titleParts.count > 1 ? titleParts[1] : nil

        let style = try fields["style"] ?! ModelParseError.tuneMissingStyle
        let tuneStyle = try TuneStyle(rawValue: style.lowercased()) ?! ModelParseError.invalidStyle

        let timeSignature: TimeSignature! = if let time = fields["time"] {
            try TimeSignature(rawValue: time) ?! ModelParseError.invalidTimeSignature
        } else {
            try tuneStyle.impliedTimeSignature ?! ModelParseError.tuneMissingTimeSignature
        }

        let noteLength: Duration! = if let note = fields["note"] {
            try Duration.fromString(note) ?! ModelParseError.invalidNoteLength
        } else {
            .eighth
        }

        context.timeSignature = timeSignature
        context.noteLength = noteLength

        return Header(
            title: titleParts[0],
            style: tuneStyle,
            composer: try fields["composer"] ?? byline ?! ModelParseError.tuneMissingComposer,
            noteLength: noteLength,
            timeSignature: timeSignature)
    }

    private func fieldAtCursor() throws -> (label: String?, value: String) {
        let node = try cursor.currentNode ?! ModelParseError.cursorAtInvalidNode
        let labelNode = node.child(byFieldName: "label")
        let valueNode = try node.child(byFieldName: "value") ?! ModelParseError.nodeMissingField
        let label: String? = if let labelNode { text(of: labelNode) } else { nil }
        let value = text(of: valueNode).trimmingCharacters(in: .whitespaces)

        if let label {
            switch label {
            case "time": context.timeSignature = try TimeSignature(rawValue: value) ?! ModelParseError.invalidTimeSignature
            case "note": context.noteLength = try Duration.fromString(value) ?! ModelParseError.invalidNoteLength
            default: break
            }
        }

        return (label, value)
    }

    private func bodyAtCursor() throws -> [Line] {
        try expectCursor(is: "body")
        return try childrenOfCursor().lines
    }

    private func lineAtCursor() throws -> Line {
        try expectCursor(is: "line")

        let children = try childrenOfCursor()

        context.lineNumberInTune += 1
        context.barNumberInLine = 0
        if let leadingField = children.unlabeledFields.first,
           leadingField == "h" {
            context.voiceNumber += 1
        } else {
            context.voiceNumber = 0
        }

        return Line(context: context, bars: children.bars, leadingBarline: children.barlines.first)
    }

    private func barAtCursor() throws -> Bar {
        try expectCursor(is: "measure")
        context.barNumberInLine += 1
        let children = try childrenOfCursor()
        let barline = try children.barlines.first ?! ModelParseError.missingBarline
        return Bar(context: context, noteClusters: children.noteClusters, trailingBarline: barline)
    }

    private func barlineAtCursor() throws -> Barline {
        // TODO: this function could be reused for leaf nodes without other context to extract
        try expectCursor(is: "barline")
        let node = try cursor.currentNode ?! ModelParseError.cursorAtInvalidNode
        let barline = try Barline(rawValue: text(of: node)) ?! ModelParseError.invalidBarline
        return barline
    }

    private func clusterAtCursor() throws -> [Note] {
        try expectCursor(is: "note_cluster")
        return try childrenOfCursor().notes
    }

    private func noteAtCursor() throws -> Note {
        let node = try cursor.currentNode ?! ModelParseError.cursorAtInvalidNode
        try expectCursor(is: "note")
        let pitchNode = try node.child(byFieldName: "pitch") ?! ModelParseError.nodeMissingField
        let pitch = try Pitch.from(string: text(of: pitchNode))
        var embellishment: Embellishment? = nil
        if let embellismentNode = node.child(byFieldName: "embellishment") {
            embellishment = try Embellishment.from(string: text(of: embellismentNode))
            _ = try pitch.gracenotes(for: embellishment!)
        }

        let duration = if let durationNode = node.child(byFieldName: "duration") {
            try context.noteLength.modified(by: text(of: durationNode))
        } else {
            context.noteLength
        }

        let note = Note(context: context,
                        pitch: pitch,
                        embellishment: embellishment,
                        duration: duration)

        return note
    }
}

enum ModelParseError: Error {
    case fileParseError
    case unknownNodeType
    case nodeHasNoChildren
    case cursorFailedToReturnToParent
    case cursorAtInvalidNode
    case nodeMissingField
    case unexpectedNodeType
    case missingBarline
    case noteTooShort
    case noteTooLong
    case noteAlreadyDotted

    case tuneMissingTitle
    case tuneMissingComposer
    case tuneMissingStyle
    case tuneMissingTimeSignature

    case invalidEmbellishment
    case invalidStyle
    case invalidTimeSignature
    case invalidBarline
    case invalidNoteLength
}

private struct NodeChildren {
    var tunes = [Tune]()
    var lines = [Line]()
    var header: Header?
    var labeledFields = [String: String]()
    var unlabeledFields = [String]()
    var bars = [Bar]()
    var barlines = [Barline]()
    var noteClusters = [[Note]]()
    var notes = [Note]()
}
