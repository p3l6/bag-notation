//
//  Formatting.swift
//
//
//  Created by Paul Landers on 4/26/24.
//

// TODO: Add a build step to generate this file from the real query files

// Keep in sync with tree-sitter-bag-notation/queries/formatting.scm

extension BagTree {
    static let formattingQuery = """
(voice
  .
  (inline_field)? @leadingField
  .
  (barline)? @leadingBarline
  .
  (bar
    (barline) @normalBarline
  )+
)
"""
}
