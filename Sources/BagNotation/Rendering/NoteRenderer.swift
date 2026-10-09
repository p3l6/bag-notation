//
//  NoteRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class NoteRenderer: BaseRenderable, Renderable<Note> {
    let note: Note
    var drawsFlag = true
    let centerJustifyAdvance: CGFloat
    let stemX: CGFloat
    var stemBottom: CGFloat
    let pitchOffset: CGFloat
    let noteheadAdvance: CGFloat
    let embellishmentAdvance: CGFloat
    let accidentalAdvance: CGFloat

    init(inside box: BoundingBox, rendering note: Note) {
        self.note = note
        embellishmentAdvance = note.embellishment?.width.advance ?? 0
        accidentalAdvance = note.accidental?.width ?? 0
        centerJustifyAdvance = (box.width - note.width.advance) / 2
        stemX = box.left + centerJustifyAdvance + embellishmentAdvance + accidentalAdvance

        pitchOffset = note.pitch.yOffset
        stemBottom = box.bottom + pitchOffset - Layout.noteStemIdealHeight
        if let chord = note.chord, chord < note.pitch {
            stemBottom = box.bottom + chord.yOffset - Layout.noteStemIdealHeight
        }

        noteheadAdvance = note.duration >= .whole ? Layout.Advance.noteHeadWhole : Layout.Advance.noteHead

        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas, with _: AnchorSet) {
        // Accidental
        if let accidental = note.accidental {
            graphics.drawSymbol(accidental.symbol, at: box.inset(x: centerJustifyAdvance + embellishmentAdvance, y: pitchOffset))
        }

        // High-A ledger line
        if note.pitch == .highA {
            graphics.drawLineHoriz(from: box.inset(x: embellishmentAdvance + centerJustifyAdvance + accidentalAdvance - Layout.ledgerLineExtension, y: pitchOffset),
                                   length: 2 * Layout.ledgerLineExtension + noteheadAdvance,
                                   width: Layout.ledgerLineWidth)
        }

        // Note head
        let noteHead = box.inset(x: centerJustifyAdvance + embellishmentAdvance + accidentalAdvance, y: pitchOffset)
        graphics.drawSymbol(note.duration.noteHeadSymbol, at: noteHead)
        var stemStart = noteHead

        // Chorded note head
        if let chord = note.chord {
            // :TODO: Offset x when pitches are only 1 step apart
            let noteHead = box.inset(x: centerJustifyAdvance + embellishmentAdvance + accidentalAdvance, y: chord.yOffset)
            graphics.drawSymbol(note.duration.noteHeadSymbol, at: noteHead)

            if chord > note.pitch {
                stemStart = noteHead
                // Note: the else case is handled in init(), when calculating initial stemBottom
            }
        }

        // Dotted not dot
        if note.duration.isDotted {
            let bumpDotUp = [.lowG, .b, .d, .f, .highA].contains(note.pitch)
            let dotHeight = bumpDotUp ? pitchOffset + Layout.noteStep : pitchOffset
            let x = Layout.noteDotSeparation + noteheadAdvance + centerJustifyAdvance
            graphics.drawSymbol(.dotted, at: box.inset(x: embellishmentAdvance + accidentalAdvance + x, y: dotHeight))
        }

        if note.duration.needsStem {
            // Stem
            let stemEnd = CGPoint(x: stemX, y: stemBottom)
            graphics.drawLine(from: stemStart,
                              to: stemEnd,
                              width: Layout.noteStemLineWidth)

            // Flag
            if drawsFlag, let flag = note.duration.flagSymbol {
                graphics.drawSymbol(flag, at: stemEnd)
            }
        }

        // Fermata
        if note.fermata {
            let x = embellishmentAdvance + centerJustifyAdvance + accidentalAdvance + noteheadAdvance / 2 - Layout.Advance.fermata / 2
            let y = switch note.pitch {
            case .highA: 12 * Layout.noteStep
            case .highG: 11 * Layout.noteStep
            default: 10 * Layout.noteStep
            }
            graphics.drawSymbol(.fermata, at: box.inset(x: x, y: y))
        }

        // Annotation
        if let annotation = note.annotation {
            graphics.drawText(annotation,
                              at: box.insetFromTop(x: embellishmentAdvance + centerJustifyAdvance + accidentalAdvance,
                                                   y: -Layout.annotationFontSize / 2),
                              fontSize: Layout.annotationFontSize)
        }
    }

    func directChildren() throws -> [any Renderable] {
        guard let embellishment = note.embellishment else { return [] }

        let embellishmentBox = BoundingBox(page: box.page, left: box.left + centerJustifyAdvance, bottom: box.bottom, width: embellishment.width.advance, height: box.height)
        return [EmbellishmentRenderer(inside: embellishmentBox, rendering: embellishment)]
    }
}

extension Note: Sizable {
    var height: Length { .full }
    var width: Length {
        var min = Layout.Advance.noteHead
        if duration >= .whole {
            min = Layout.Advance.noteHeadWhole
        }
        if duration.isDotted {
            min += Layout.Advance.noteDot + Layout.noteDotSeparation
        }
        if let accidental {
            min += accidental.width
        }
        return .atLeast(min) + (embellishment?.width ?? .zero)
    }
}

extension Note: Anchored {
    var id: String { context.identifier }
    typealias Anchors = Notenchors
    struct Notenchors {
        var noteheadLeft: CGFloat
        var noteheadRight: CGFloat
        var noteheadTop: CGFloat
    }
}

extension NoteRenderer: Anchorable {
    typealias Anchor = Note
    var anchor: Note { note }
    func anchors() -> Note.Notenchors {
        .init(noteheadLeft: stemX,
              noteheadRight: stemX + noteheadAdvance,
              noteheadTop: box.bottom + note.pitch.yOffset + Layout.noteStep)
    }
}

extension Pitch {
    var yOffset: CGFloat {
        let steps = switch self {
        case .highA: 10
        case .highG: 9
        case .f: 8
        case .e: 7
        case .d: 6
        case .c: 5
        case .b: 4
        case .lowA: 3
        case .lowG: 2
        }

        return CGFloat(steps) * Layout.noteStep
    }
}

extension Duration {
    var noteHeadSymbol: BravuraSymbol {
        switch self {
        case .whole, .wholeDotted: .noteHeadWhole
        case .half, .halfDotted: .noteHeadHalf
        default: .noteHead
        }
    }

    var needsStem: Bool {
        self < .whole
    }

    var beamCount: Int {
        switch self {
        case .eighth, .eighthDotted: 1
        case .sixteenth, .sixteenthDotted: 2
        case .thirtysecond, .thirtysecondDotted: 3
        case .sixtyfourth, .sixtyfourthDotted: 4
        default: 0
        }
    }

    var flagSymbol: BravuraSymbol? {
        switch self {
        case .eighth, .eighthDotted: .flag8th
        case .sixteenth, .sixteenthDotted: .flag16th
        case .thirtysecond, .thirtysecondDotted: .flag32nd
        case .sixtyfourth, .sixtyfourthDotted: .flag64th
        default: nil
        }
    }
}

extension Accidental {
    var width: CGFloat {
        switch self {
        case .sharp: Layout.Advance.accidentalSharp + Layout.noteGracenoteSeparation
        case .flat: Layout.Advance.accidentalFlat + Layout.noteGracenoteSeparation
        case .natural: Layout.Advance.accidentalNatural + Layout.noteGracenoteSeparation
        }
    }

    var symbol: BravuraSymbol {
        switch self {
        case .sharp: .accidentalSharp
        case .flat: .accidentalFlat
        case .natural: .accidentalNat
        }
    }
}

#endif // !os(Linux)
