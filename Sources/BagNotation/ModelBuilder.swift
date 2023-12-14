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
//    var context: SomeActiveProps like harmony, tempo, meter etc

    init(_ source: String) { self.source = source}

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

    func makeModel() -> Doc {
//        modelDebug(from: tree.rootNode!)

        cursor = tree.rootNode!.treeCursor
        return docAtCursor()
    }

    private func text(at range: TSRange) -> String {
        let buf: [UInt16] = Array(source.utf16)
        let hmm = buf[Int(range.bytes.lowerBound/2)..<Int(range.bytes.upperBound/2)]
        return String(utf16CodeUnits: Array(hmm), count: hmm.count)
    }

    private func text(of node: Node) -> String {
        text(at: node.tsRange)
    }

    private func childrenOfCursor() -> NodeChildren {
        var childs = NodeChildren()

        cursor.goToFirstChild()
        repeat {
            switch cursor.currentNode!.nodeType {
            case "tune": childs.tunes.append(tuneAtCursor())
            case "line": childs.lines.append(lineAtCursor())
            case "header": childs.header = headerAtCursor()
            case "body": childs.lines.append(contentsOf: bodyAtCursor())
            case "measure": childs.bars.append(barAtCursor())
            case "note_cluster": childs.notes.append(contentsOf: clusterAtCursor())
            case "note": childs.notes.append(noteAtCursor())
            default: break // TODO: throw
            }
        } while cursor.gotoNextSibling()
        cursor.gotoParent()

        return childs
    }

    private func expectCursor(is type: String) {
        // TODO: should throw
        guard let node = cursor.currentNode, node.nodeType == type else {
            // TODO: is logger available?
            print("Incorrect node type: have \(cursor.currentNode?.nodeType ?? "nil") expected \(type)")
            exit(2)
        }
    }

    // MARK: Nodes at cursor

    private func docAtCursor() -> Doc {
        expectCursor(is: "file")
        return Doc(tunes: childrenOfCursor().tunes)
    }

    private func tuneAtCursor() -> Tune {
        expectCursor(is: "tune")
        let children = childrenOfCursor()
        return Tune(header: children.header!,
                    lines: children.lines)
    }

    private func headerAtCursor() -> Header {
        expectCursor(is: "header")
        return Header(
            title : "",
            style : "",
            composer : "",
            noteLength: "",
            timeSignature: "", tags : [])
    }

    private func bodyAtCursor() -> [Line] {
        expectCursor(is: "body")
        return childrenOfCursor().lines
    }

    // TODO: probably don't need the new field names for most grammer elements
    // TODO: make an enum thingy for field name strings
    // TODO: also enum the node types (or static string constants)
    //    uint32_t ts_language_field_count(const TSLanguage *);
    //    const char *ts_language_field_name_for_id(const TSLanguage *, TSFieldId);
    //    TSFieldId ts_language_field_id_for_name(const TSLanguage *, const char *, uint32_t);

    private func lineAtCursor() -> Line {
        expectCursor(is: "line")
        return Line(bars: childrenOfCursor().bars)
    }

    private func barAtCursor() -> Bar {
        expectCursor(is: "measure")
        return Bar(notes: childrenOfCursor().notes)
    }

    private func clusterAtCursor() -> [Note] {
        expectCursor(is: "note_cluster")
        return childrenOfCursor().notes
    }

    private func noteAtCursor() -> Note {
        let node = cursor.currentNode!
        expectCursor(is: "note")
        // TODO: consider custom node wrappers? or a node extension for these fields properties.
        let pitchNode = node.child(byFieldName: "pitch")!
        let embellismentNode = node.child(byFieldName: "embellishment")
        let emb: Embellishment? = if let embellismentNode { Embellishment.from(string: text(of: embellismentNode)) } else {nil}
        return Note(pitch: .from(string: text(of: pitchNode))!,
                    embellishment: emb,
                    duration: "")
    }
}

private struct NodeChildren {
    var tunes = [Tune]()
    var lines = [Line]()
    var header: Header?
    var bars = [Bar]()
    var notes = [Note]()
}

// TODO: special operator ?!
