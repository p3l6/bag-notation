//
//  ModelBuilder.swift
//  Bag Notation
//

import Foundation
import SwiftTreeSitter
import TreeSitterBagNotation

// TODO: names and organization

class ModelBuilder {
    let source: String
    private var cursor: TreeCursor!
    var context: Context = Context()

    init(_ source: String) { self.source = source }

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
                print("\(indent)\(currentNode.nodeType!.trimmingCharacters(in: .whitespacesAndNewlines)) \(currentNode.range.byteRange) \(text(of: currentNode).trimmingCharacters(in: .whitespacesAndNewlines))")
            } else {
                print("\(indent)\(currentNode.nodeType!) \(currentNode.range.byteRange)")
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

    func makeModel() throws -> Doc {
//        modelDebug(from: tree.rootNode!)

        cursor = tree.rootNode!.treeCursor
        return try docAtCursor()
    }

    private func text(at range: TSRange) -> String {
        let buf: [UInt16] = Array(source.utf16)
        let hmm = buf[Int(range.bytes.lowerBound/2)..<Int(range.bytes.upperBound/2)]
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
            switch currentNode.nodeType {
            case "tune": childs.tunes.append(try tuneAtCursor())
            case "line": childs.lines.append(try lineAtCursor())
            case "header": childs.header = try headerAtCursor()
            case "body": childs.lines.append(contentsOf: try bodyAtCursor())
            case "measure": childs.bars.append(try barAtCursor())
            case "note_cluster": childs.notes.append(contentsOf: try clusterAtCursor())
            case "note": childs.notes.append(try noteAtCursor())
            default: throw ModelParseError.unknownNodeType
            }
        } while cursor.gotoNextSibling()
        guard cursor.gotoParent() else { throw ModelParseError.cursorFailedToReturnToParent }

        return childs
    }

    private func expectCursor(is type: String) throws {
        guard let node = cursor.currentNode, node.nodeType == type else {
            // TODO: is logger available?
            print("Incorrect node type: have \(cursor.currentNode?.nodeType ?? "nil") expected \(type)")
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
        // modify/read context before calling children
        let children = try childrenOfCursor()
        return Tune(header: children.header!,
                    lines: children.lines)
    }

    private func headerAtCursor() throws -> Header {
        try expectCursor(is: "header")
        // TODO: set header fields, and context
        return Header(
            title : "",
            style : "",
            composer : "",
            noteLength: "",
            timeSignature: "", tags : [])
    }

    private func bodyAtCursor() throws -> [Line] {
        try expectCursor(is: "body")
        return try childrenOfCursor().lines
    }

    private func lineAtCursor() throws -> Line {
        try expectCursor(is: "line")
        context.lineNumberInTune += 1
        context.barNumberInLine = 0
        return Line(context: context, bars: try childrenOfCursor().bars)
    }

    private func barAtCursor() throws -> Bar {
        try expectCursor(is: "measure")
        context.barNumberInLine += 1
        return Bar(context: context, notes: try childrenOfCursor().notes)
    }

    private func clusterAtCursor() throws -> [Note] {
        try expectCursor(is: "note_cluster")
        return try childrenOfCursor().notes
    }

    private func noteAtCursor() throws -> Note {
        let node = try cursor.currentNode ?! ModelParseError.cursorAtInvalidNode
        try expectCursor(is: "note")
        let pitchNode = try node.child(byFieldName: "pitch") ?! ModelParseError.nodeMissingField
        let embellismentNode = node.child(byFieldName: "embellishment")
        let emb: Embellishment? = if let embellismentNode { try Embellishment.from(string: text(of: embellismentNode)) } else { nil }
        return Note(context: context,
                    pitch: try .from(string: text(of: pitchNode)),
                    embellishment: emb,
                    duration: "")
    }
}

enum ModelParseError: Error {
    case unknownNodeType
    case nodeHasNoChildren
    case cursorFailedToReturnToParent
    case cursorAtInvalidNode
    case nodeMissingField
    case unexpectedNodeType
}

private struct NodeChildren {
    var tunes = [Tune]()
    var lines = [Line]()
    var header: Header?
    var bars = [Bar]()
    var notes = [Note]()
}
