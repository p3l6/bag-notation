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
  (field)? @leadingField
  .
  (barline)? @leadingBarline
  .
  (bar
    .
    (cluster . (note) @firstNote)
    (barline) @normalBarline
  )
  .
  (bar
    (barline) @normalBarline
  )+
)
"""
}
