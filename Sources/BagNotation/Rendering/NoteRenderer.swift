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

    init(inside box: BoundingBox, rendering note: Note) {
        self.note = note
        embellishmentAdvance = note.embellishment?.width.advance ?? 0
        centerJustifyAdvance = (box.width - note.width.advance) / 2
        stemX = box.left + centerJustifyAdvance + embellishmentAdvance

        pitchOffset = note.pitch.yOffset
        stemBottom = box.bottom + pitchOffset - Layout.noteStemIdealHeight

        noteheadAdvance = note.duration >= .whole ? Layout.Advance.noteHeadWhole : Layout.Advance.noteHead

        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas) {
        // High-A ledger line
        if note.pitch == .highA {
            graphics.drawLineHoriz(from: box.inset(x: embellishmentAdvance + centerJustifyAdvance - Layout.ledgerLineExtension, y: pitchOffset),
                                   length: 2 * Layout.ledgerLineExtension + noteheadAdvance,
                                   width: Layout.ledgerLineWidth)
        }

        // Note head
        let noteHead = box.inset(x: centerJustifyAdvance + embellishmentAdvance, y: pitchOffset)
        graphics.drawSymbol(note.duration.noteHeadSymbol, at: noteHead)

        // Dotted not dot
        if note.duration.isDotted {
            let bumpDotUp = [.lowG, .b, .d, .f, .highA].contains(note.pitch)
            let dotHeight = bumpDotUp ? pitchOffset + Layout.noteStep : pitchOffset
            let x = Layout.noteDotSeparation + noteheadAdvance + centerJustifyAdvance
            graphics.drawSymbol(.dotted, at: box.inset(x: embellishmentAdvance + x, y: dotHeight))
        }

        if note.duration.needsStem {
            // Stem
            let stemEnd = CGPoint(x: stemX, y: stemBottom)
            graphics.drawLine(from: noteHead,
                              to: stemEnd,
                              width: Layout.noteStemLineWidth)

            // Flag
            if drawsFlag, let flag = note.duration.flagSymbol {
                graphics.drawSymbol(flag, at: stemEnd)
            }
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
        return .atLeast(min) + (embellishment?.width ?? .zero)
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

#endif // !os(Linux)
