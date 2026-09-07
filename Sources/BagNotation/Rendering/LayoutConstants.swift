//
//  LayoutConstants.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

// :TODO: Should this be configurable? instead of global? via settings, based on page size, etc?
enum LayoutConstants {
    static let staffSpacing: CGFloat = 20
    static let staffLineSpacing: CGFloat = 6
    static let staffLineWidth: CGFloat = 0.7
    static let noteStep: CGFloat = 3
    static let pageMargin: CGFloat = 20
    static let tuneHeaderHeight: CGFloat = 20
    static let noteSpacingMin: CGFloat = 4
    static let noteStemLineWidth: CGFloat = 1.2
    static let noteStemIdealHeight: CGFloat = 25
}

#endif // !os(Linux)
