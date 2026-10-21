//
//  Highlighting.swift
//  Bag Notation
//

// TODO: Add a build step to generate this file from the real query files

// Keep in sync with tree-sitter-bag-notation/queries/highlighting.scm

extension BagTree {
    public static let highlightQuery = """
        ; highlights.scm

        (comment) @comment
        (tail_comment) @comment

        (field_label) @keyword
        (shorthand_label) @keyword
        (field_value) @string

        (barline) @operator

        (embellishment) @variable
        (pitch) @type.builtin
        (duration) @number
        (connector) @operator

        """
}
