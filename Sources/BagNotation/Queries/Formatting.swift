//
//  Formatting.swift
//  Bag Notation
//

// TODO: Add a build step to generate this file from the real query files

// Keep in sync with tree-sitter-bag-notation/queries/formatting.scm

extension BagTree {
    public static let alignmentQuery = """
        (voice
          .
          (field)? @leadingField
          .
          (barline)? @leadingBarline
          .
          (bar
            (barline) @normalBarline
          )+
        )
        """

    public static let allBarsQuery = """
        (bar
          (barline)? @barline 
        ) @bar
        """
}
