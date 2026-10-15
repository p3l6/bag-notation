//
//  NoteRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

struct NoteRenderer: Renderable {
    let box: BoundingBox
    let note: Note
    let flag: Flag
    let centerJustifyAdvance: CGFloat
    let stemX: CGFloat
    let stemBottom: CGFloat
    let pitchOffset: CGFloat
    let noteheadAdvance: CGFloat
    let embellishmentAdvance: CGFloat
    let accidentalAdvance: CGFloat

    init(box: BoundingBox, note: Note, flag: Flag) {
        self.note = note
        self.box = box
        self.flag = flag
        embellishmentAdvance = note.embellishment?.size.advance ?? 0
        accidentalAdvance = note.accidental?.width ?? 0
        // :TODO: Avoid centering when a bar has only a single note.
        centerJustifyAdvance = (box.width - note.size.advance) / 2
        stemX = box.left + centerJustifyAdvance + embellishmentAdvance + accidentalAdvance

        pitchOffset = note.pitch.yOffset
        stemBottom = if let chord = note.chord, chord < note.pitch {
            box.bottom + chord.yOffset - Layout.noteStemIdealHeight
        } else {
            box.bottom + pitchOffset - Layout.noteStemIdealHeight
        }
        noteheadAdvance = note.duration >= .whole ? Layout.Advance.noteHeadWhole : Layout.Advance.noteHead
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
            if case let .flag(flagSymbol) = flag {
                graphics.drawSymbol(flagSymbol, at: stemEnd)
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
            // :TODO: Consider variation space, should be inline or under, non on top
            graphics.drawText(annotation,
                              at: box.insetFromTop(x: embellishmentAdvance + centerJustifyAdvance + accidentalAdvance,
                                                   y: -Layout.annotationFontSize / 2),
                              fontSize: Layout.annotationFontSize)
        }
    }

    func directChildren() throws -> [any Renderable] {
        guard let embellishment = note.embellishment else { return [] }

        let embellishmentBox = BoundingBox(page: box.page, left: box.left + centerJustifyAdvance, bottom: box.bottom, width: embellishment.size.advance, height: box.height)
        return [EmbellishmentRenderer(box: embellishmentBox, embellishment: embellishment)]
    }
}

extension Note: Sizable {
    var reserved: (leading: CGFloat, trailing: CGFloat) { (.zero, .zero) }
    var kernableLeader: CGFloat? { nil }
    var childDirection: LayoutDirection { .horizontal }
    var childSpacing: CGFloat { .zero }
    var childSizables: [any Sizable] {
        if let embellishment { [embellishment] } else { [] }
    }

    var size: Length {
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
        return .atLeast(min) + totalChildSize
    }
}

extension Note: Anchored {
    var id: String { context.identifier }
    typealias Anchors = NoteAnchors
    struct NoteAnchors {
        let noteheadLeft: CGFloat
        let noteheadRight: CGFloat
        let noteheadTop: CGFloat
        let stemX: CGFloat
        let stemBottom: CGFloat
        let flagType: Flag
    }
}

extension NoteRenderer: Anchorable {
    typealias Anchor = Note
    var anchor: Note { note }
    func anchors() -> Note.NoteAnchors {
        .init(noteheadLeft: stemX,
              noteheadRight: stemX + noteheadAdvance,
              noteheadTop: box.bottom + note.pitch.yOffset + Layout.noteStep,
              stemX: stemX,
              stemBottom: stemBottom,
              flagType: flag)
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
}

enum Flag: Equatable {
    case none
    case flag(BravuraSymbol)
    case beam(Int)

    static func fromDuration(_ duration: Duration) -> Flag {
        switch duration {
        case .eighth, .eighthDotted: .flag(.flag8th)
        case .sixteenth, .sixteenthDotted: .flag(.flag16th)
        case .thirtysecond, .thirtysecondDotted: .flag(.flag32nd)
        case .sixtyfourth, .sixtyfourthDotted: .flag(.flag64th)
        default: .none
        }
    }

    var asBeam: Flag {
        switch self {
        case .flag(.flag8th): .beam(1)
        case .flag(.flag16th): .beam(2)
        case .flag(.flag32nd): .beam(3)
        case .flag(.flag64th): .beam(4)
        default: self
        }
    }

    var asFlag: Flag {
        switch self {
        case .beam(1): .flag(.flag8th)
        case .beam(2): .flag(.flag16th)
        case .beam(3): .flag(.flag32nd)
        case .beam(4): .flag(.flag64th)
        default: self
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
