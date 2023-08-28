//
//  File.swift
//  
//
//  Created by Paul Landers on 8/28/23.
//

import Foundation
import SwiftTreeSitter
import TreeSitterBagfile


let language = Language(language: tree_sitter_bagfile())

let parser = Parser()
try? parser.setLanguage(language)


let source = """
func hello() {
    print("hello from tree-sitter")
}
"""

let tree = parser.parse(source)!

print("tree: ", tree)

