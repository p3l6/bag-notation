//
//  main.swift
//  Bag Notation
//

import Foundation
import SwiftTreeSitter
import TreeSitterBagNotation

let language = Language(language: tree_sitter_bag_notation())

let parser = Parser()
try? parser.setLanguage(language)

let source = """
    func hello() {
        print("hello from tree-sitter")
    }
    """

let tree = parser.parse(source)!

print("tree: ", tree)
