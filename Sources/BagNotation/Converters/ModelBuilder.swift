//
//  ModelBuilder.swift
//  Bag Notation
//

import SwiftTreeSitter
import TreeSitterBagNotation

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
        return String(utf16CodeUnits: Array(hmm), count: hmm.count).trimmingCharacters(in: .whitespaces)
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
            case "field", "inline_field": childs.fields.append(try fieldAtCursor())
            case "body": childs.lines.append(contentsOf: try bodyAtCursor())
            case "measure": childs.bars.append(try barAtCursor())
            case "barline": childs.barlines.append(try barlineAtCursor())
            case "note_cluster": childs.noteClusters.append(try clusterAtCursor())
            case "note": childs.notes.append(try noteAtCursor())
            case "comment", "tail_comment": break
            case "ERROR":
                ModelParseError.logger.error("File could not be parsed at line \(currentNode.pointRange.lowerBound.row + 1) col \(currentNode.pointRange.lowerBound.column / 2)")
                throw ModelParseError.fileParseError
            default:
                ModelParseError.logger.error("Unknown node type encountered: \(currentNode.nodeType!)")
                throw ModelParseError.unknownNodeType
            }
        } while cursor.gotoNextSibling()
        guard cursor.gotoParent() else { throw ModelParseError.cursorFailedToReturnToParent }

        return childs
    }

    private func expectCursor(is type: String) throws {
        guard let node = cursor.currentNode, node.nodeType == type else {
            ModelParseError.logger.error("Incorrect node type: have \(self.cursor.currentNode?.nodeType ?? "nil") expected \(type)")
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

        let fields = try childrenOfCursor().fields.uniqueByLabel()

        guard let titleField = fields[.title] else { throw ModelParseError.tuneMissingTitle }
        guard let styleField = fields[.style] else { throw ModelParseError.tuneMissingStyle }

        let (title, byline) = titleField.asTitle()
        let possibleComposers = [fields[.composer]?.value, byline, (fields[.trad] != nil ? "trad" : nil)].compactMap { $0 }

        guard possibleComposers.count <= 1 else { throw ModelParseError.duplicateComposers }

        let style = try styleField.asStyle()

        context.timeSignature = try (try? fields[.time]?.asTimeSignature()) ?? style.impliedTimeSignature ?! ModelParseError.tuneMissingTimeSignature
        context.noteLength = (try? fields[.note]?.asDuration()) ?? Duration.eighth

        return Header(
            title: title,
            style: style,
            composer: try possibleComposers.first ?! ModelParseError.tuneMissingComposer,
            noteLength: context.noteLength,
            timeSignature: context.timeSignature)
    }

    private func fieldAtCursor() throws -> Field {
        let node = try cursor.currentNode ?! ModelParseError.cursorAtInvalidNode
        let labelNode = try node.child(byFieldName: "label") ?! ModelParseError.nodeMissingChild
        let valueNode = node.child(byFieldName: "value")
        let label = text(of: labelNode)
        let value: String? = if let valueNode { text(of: valueNode) } else { nil }

        let field = try Field(label: label, value: value)

        switch field.label {
        case .time: context.timeSignature = try field.asTimeSignature() ?! ModelParseError.invalidTimeSignature
        case .note: context.noteLength = try field.asDuration() ?! ModelParseError.invalidNoteLength
        default: break
        }

        return field
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
        if let leadingField = children.fields.first, leadingField.label == .h {
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
        let pitchNode = try node.child(byFieldName: "pitch") ?! ModelParseError.nodeMissingChild
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

private struct NodeChildren {
    var tunes = [Tune]()
    var lines = [Line]()
    var header: Header?
    var fields = [Field]()
    var bars = [Bar]()
    var barlines = [Barline]()
    var noteClusters = [[Note]]()
    var notes = [Note]()
}
