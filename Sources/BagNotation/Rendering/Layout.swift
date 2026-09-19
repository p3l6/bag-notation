//
//  Layout.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

// :TODO: Should this be configurable? instead of global? via settings, based on page size, etc?
enum Layout {
    // :TODO: Eventual target around 4 to match previous methods
    // Then of course staff separation will play a big part too
    static let baseScale: CGFloat = 4

    // Other explicit constants

    static let tuneSeparation: CGFloat = 10
    static let staffSeparation: CGFloat = 20
    static let staffJoinedSeparation: CGFloat = 12
    static let pageMargin: CGFloat = 20
    static let tuneHeaderHeight: CGFloat = 50

    // Scaled constants
    // These values are based on the ones included in the Bravura.json file downloaded with the font release

    /// Staff line spacing is the main metric by which bravura-font related items are scaled
    static let staffLineSpacing = baseScale
    static let bravuraFontSize = 4 * baseScale
    static let bravuraFontSmallSize = 2.4 * baseScale
    static let staffLineWidth = 0.13 * baseScale
    static let noteStep = 0.5 * baseScale
    static let noteStemLineWidth = 0.12 * baseScale
    static let noteStemIdealHeight = 3.2 * baseScale
    static let noteBeamLineWidth = 0.5 * baseScale
    static let noteBeamSeparation = 0.25 * baseScale
    static let noteBeamPartialExtension = 0.75 * Advance.noteHead
    static let noteGracenoteSeparation = 0.3 * baseScale
    static let gracenoteStemIdealHeight = 2.4 * baseScale
    static let gracenoteStemLineWidth = 0.1 * baseScale
    static let gracenoteBeamLineWidth = 0.25 * baseScale
    static let gracenoteBeamSeparation = 0.18 * baseScale
    static let gracenoteLedgerLineExtension = 0.28 * baseScale
    static let gracenoteSeparation = 0.12 * baseScale
    static let noteDotSeparation = 0.25 * baseScale
    static let ledgerLineWidth = 0.16 * baseScale
    static let ledgerLineExtension = 0.4 * baseScale
    static let barlineSeparation = 0.4 * baseScale
    static let barlineDotSeparation = 0.16 * baseScale
    static let barlineLineWidth = 0.16 * baseScale
    static let barlineThickLineWidth = 0.5 * baseScale
    static let variationBracketLineWidth = 0.12 * baseScale
    static let variationBracketHeight = 2.8 * baseScale

    /// Space used by various font elements
    /// These values are based on the ones included in the Bravura.json file downloaded with the font release
    enum Advance {
        static let gClef = 2.685 * baseScale
        static let repeatDots = 0.4 * baseScale
        static let noteHead = 1.18 * baseScale
        static let noteHeadWhole = 1.688 * baseScale
        static let gracenoteHead = noteHead * bravuraFontSmallSize / bravuraFontSize
        static let noteDot = 0.4 * baseScale
        static let timeSig = 1.75 * baseScale
    }

    /*

     TBD

     "tieEndpointThickness": 0.1,
     "tieMidpointThickness": 0.22,
     "tupletBracketThickness": 0.16
     */
}

enum BravuraSymbol: String {
    case noteHeadWhole = "\u{E0A2}"
    case noteHeadHalf = "\u{E0A3}"
    case noteHead = "\u{E0A4}"
    case gClef = "\u{E050}"
    case repeatDots = "\u{E043}"
    case flag8th = "\u{E241}"
    case flag16th = "\u{E243}"
    case flag32nd = "\u{E245}"
    case flag32ndUp = "\u{E244}"
    case flag64th = "\u{E247}"
    case dotted = "\u{E1E7}"
    case timeSig1 = "\u{E081}"
    case timeSig2 = "\u{E082}"
    case timeSig3 = "\u{E083}"
    case timeSig4 = "\u{E084}"
    case timeSig5 = "\u{E085}"
    case timeSig6 = "\u{E086}"
    case timeSig7 = "\u{E087}"
    case timeSig8 = "\u{E088}"
    case timeSig9 = "\u{E089}"
    case timeSig12 = "\u{E081}\u{E082}"

    // More: https://smufl.formats.music/latest/tables/staff-brackets-and-dividers.html
}

#endif // !os(Linux)
