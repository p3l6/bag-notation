//
//  Layout.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

// :TODO: Should this be configurable? instead of global? via settings, based on page size, etc?
enum Layout {
    static let baseScale: CGFloat = 6

    // Other explicit constants

    static let staffSeparation: CGFloat = 20
    static let pageMargin: CGFloat = 20
    static let tuneHeaderHeight: CGFloat = 20

    // Scaled constants
    // These values are based on the ones included in the Bravura.json file downloaded with the font release

    /// Staff line spacing is the main metric by which bravura-font related items are scaled
    static let staffLineSpacing = baseScale
    static let bravuraFontSize = 4 * baseScale
    static let staffLineWidth = 0.13 * baseScale
    static let noteStep = 0.5 * baseScale
    static let noteSpacingMin = 1.18 * baseScale
    static let noteStemLineWidth = 0.12 * baseScale
    static let noteStemIdealHeight = 3.2 * baseScale
    static let noteBeamWidth = 0.5 * baseScale
    static let noteBeamSeparation = 0.25 * baseScale
    static let ledgerLineWidth = 0.16 * baseScale
    static let ledgerLineExtension = 0.4 * baseScale
    static let barlineSeparation = 0.4 * baseScale
    static let barlineDotSeparation = 0.16 * baseScale
    static let barlineLineWidth = 0.16 * baseScale
    static let barlineThickLineWidth = 0.5 * baseScale

    /// Space used by various font elements
    /// These values are based on the ones included in the Bravura.json file downloaded with the font release
    enum Advance {
        static let gClef = 2.685 * baseScale
        static let repeatDots = 0.4 * baseScale
    }

    /*

     TBD

     "tieEndpointThickness": 0.1,
     "tieMidpointThickness": 0.22,
     "tupletBracketThickness": 0.16
     */
}

enum BravuraSymbol: String {
    case noteHead = "\u{E0A4}"
    case gClef = "\u{E050}"
    case repeatDots = "\u{E043}"
    // More: https://smufl.formats.music/latest/tables/staff-brackets-and-dividers.html
}

#endif // !os(Linux)
