//
//  ModelBuilder.swift
//  Bag Notation
//

import Foundation
import SwiftTreeSitter
import TreeSitterBagNotation

// TODO: names and organization

func makeModel(from tree: Tree) -> Doc {
    Doc(treeNode: tree.rootNode!)
}

func makeTree(source: String) -> Tree {
    let language = Language(language: tree_sitter_BagNotation())
    let parser = Parser()
    try? parser.setLanguage(language)
    let tree = parser.parse(source)
    return tree!
}

extension Node {
    func allChildren() -> [Node] {
        (0 ..< childCount).compactMap(child(at:))
    }
}

protocol NodeConvertible {
    init(treeNode node: Node)
}

extension Doc: NodeConvertible {
    init(treeNode node: Node) {
        // TODO: all of these should guard on the node type, and throw
        tunes = node.allChildren().map { Tune(treeNode: $0) }
    }
}

extension Tune: NodeConvertible {
    init(treeNode node: Node) {
        header = Header(treeNode: node.child(at: 0)!)
        lineOffset = 0
        // TODO: switch over types? comments have to go somewhere
        lines = node.allChildren().map { Line(treeNode: $0) }
    }
}

extension Header: NodeConvertible {
    init(treeNode _: Node) {
        title = ""
        style = ""
        composer = ""
        noteLength = ""
        tags = []
        timeSignature = ""
    }
}

extension Line: NodeConvertible {
    init(treeNode node: Node) {
        bars = node.allChildren().map { Bar(treeNode: $0) }
    }
}

extension Bar: NodeConvertible {
    init(treeNode node: Node) {
        notes = node.allChildren().map { Note(treeNode: $0) }
    }
}

extension Note: NodeConvertible {
    init(treeNode _: Node) {
        duration = ""
        embellishment = 0
        extras = ""
        value = 0
    }
}
