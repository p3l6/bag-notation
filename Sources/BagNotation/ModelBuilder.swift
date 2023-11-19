//
//  ModelBuilder.swift
//  Bag Notation
//

import Foundation
import SwiftTreeSitter
import TreeSitterBagNotation

// TODO: names and organization
// keep all the tree sitter stuff out of the model dir. could split this out into separate files still?

class ModelBuilder {
    let source: String
    init(_ source: String) { self.source = source}

    lazy var tree: Tree = {
        let language = Language(language: tree_sitter_BagNotation())
        let parser = Parser()
        try? parser.setLanguage(language)
        let tree = parser.parse(source)
        return tree!
    }()

    func modelDebug(from node: Node) {
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
        return newDoc(treeNode: tree.rootNode!)
    }

    func text(at range: TSRange) -> String {
        let buf: [UInt16] = Array(source.utf16)
        let hmm = buf[Int(range.bytes.lowerBound/2)..<Int(range.bytes.upperBound/2)]
        return String(utf16CodeUnits: Array(hmm), count: hmm.count)
    }

    func text(of node: Node) -> String {
        text(at: node.tsRange)
    }

    func expect(node: Node, is type: String) {
        // TODO: should throw
        guard node.nodeType == type else {
            // TODO: is logger available?
            print("Incorrect node type: have \(node.nodeType ?? "nil") expected \(type)")
            exit(2)
        }
    }


    func newDoc(treeNode node: Node) -> Doc {
        expect(node: node, is: "file")
        return Doc(
            // TODO: all of these should guard on the node type, and throw
            tunes: node.allChildren().map { newTune(treeNode: $0) }
        )
    }

    func newTune(treeNode node: Node) -> Tune {
        expect(node: node, is: "tune")
        //        let cur = node.treeCursor
        //        let children = cur.
        return Tune(
            header: newHeader(treeNode: node.child(byFieldName:  "header")!),
            // TODO: helper for this:  `childrenbytype: [string: [node]]`
            lines: node.child(byFieldName: "body")!.allChildren().filter { $0.nodeType == "line" }.map { newLine(treeNode: $0) }

        )
    }

    // TODO: make an enum thingy for field name strings
    //    uint32_t ts_language_field_count(const TSLanguage *);
    //    const char *ts_language_field_name_for_id(const TSLanguage *, TSFieldId);
    //    TSFieldId ts_language_field_id_for_name(const TSLanguage *, const char *, uint32_t);

    func newHeader(treeNode node: Node) -> Header {
        expect(node: node, is: "header")
        return Header(
            title : "",
            style : "",
            composer : "",
            noteLength: "",
            timeSignature: "", tags : [])
    }

    func newLine(treeNode node: Node) -> Line {
        expect(node: node, is: "line")
        
        // TODO: keep converting these methods from newThing to thingAtCursor
        cursor = node.treeCursor

        var bars = [Bar]()

        cursor.traverseImmediateChilds { child in
            switch child.nodeType {
            case "measure":
                bars.append(barAtCursor())
            default: break
            }
        } 

        return Line(bars: bars)
    }

    func barAtCursor() -> Bar {
        let node = cursor.currentNode!
        // TODO: also enum the node types
        expect(node: node, is: "measure")

        var notes = [Note]()

        cursor.traverseImmediateChilds { child in
            switch child.nodeType {
            case "note_cluster":
                cursor.traverseImmediateChilds { subchild in
                    notes.append(noteAtCursor())
                }
            default: break
            }
        } 

        return Bar(notes: notes)
    }

    var cursor: TreeCursor!
//    var context: SomeActiveProps like harmony, tempo, meter etc

    func noteAtCursor() -> Note {
        let node = cursor.currentNode!
        expect(node: node, is: "note")
        // TODO: consider custom node wrappers? or a node extension for these fields properties.
        let pitchNode = node.child(byFieldName: "pitch")!
        let embellismentNode = node.child(byFieldName: "embellishment")
        let emb: Embellishment? = if let embellismentNode { Embellishment.from(string: text(of: embellismentNode)) } else {nil}
        return Note(pitch: .from(string: text(of: pitchNode))!,
                    embellishment: emb,
                    duration: "",
                    extras: "")
    }
}

extension TreeCursor {
    func traverseImmediateChilds(block: (Node) throws -> Void) rethrows {
        self.goToFirstChild()
        repeat {
            try block(self.currentNode!)
        } while self.gotoNextSibling()
        self.gotoParent()
    }
}

extension Node {
    func allChildren() -> [Node] {
        (0 ..< childCount).compactMap(child(at:))
    }
}

// TODO: special operator ?!
