//
//  EmbellishmentRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

struct EmbellishmentRenderer: Renderable {
    let box: BoundingBox
    let embellishment: Embellishment

    func render(in graphics: RenderCanvas, with _: AnchorSet) {
        let maxPitch = embellishment.pitches.max()!
        let stemTop = box.bottom + maxPitch.yOffset + Layout.gracenoteStemIdealHeight
        var noteHeads = [CGPoint]()

        for (index, pitch) in embellishment.pitches.enumerated() {
            // :TODO: Consider kerning for these, based on previous pitch proximity. ie if previouspitchY - Y >= 1 staffspace. but only upward
            let noteHead = box.inset(x: CGFloat(index) * (Layout.Advance.gracenoteHead + Layout.gracenoteSeparation), y: pitch.yOffset)
            noteHeads.append(noteHead)

            // Draw ledger if needed
            if pitch == .highA {
                graphics.drawLineHoriz(from: CGPoint(x: noteHead.x - Layout.gracenoteLedgerLineExtension, y: noteHead.y),
                                       length: Layout.gracenoteLedgerLineExtension * 2 + Layout.Advance.gracenoteHead,
                                       width: Layout.ledgerLineWidth)
            }

            // Draw notehead
            graphics.drawSymbol(.noteHead, at: noteHead, small: true)

            // Draw stem
            graphics.drawLineVert(from: CGPoint(x: noteHead.x + Layout.Advance.gracenoteHead, y: noteHead.y),
                                  length: stemTop - noteHead.y,
                                  width: Layout.gracenoteStemLineWidth)
        }

        // Draw flag and exit, if singling
        guard let first = noteHeads.first else { return }
        guard noteHeads.count > 1, let last = noteHeads.last else {
            graphics.drawSymbol(.flag32ndUp, at: CGPoint(x: first.x + Layout.Advance.gracenoteHead, y: stemTop), small: true)
            return
        }

        // Draw three beams
        let length = last.x - first.x
        for beamIndex in 0 ..< 3 {
            let y = stemTop - CGFloat(beamIndex) * (Layout.gracenoteBeamLineWidth + Layout.gracenoteBeamSeparation)
            graphics.drawLineHoriz(from: CGPoint(x: first.x + Layout.Advance.gracenoteHead, y: y),
                                   length: length,
                                   width: Layout.gracenoteBeamLineWidth)
        }
    }

    func directChildren() throws -> [any Renderable] { [] }
}

extension Embellishment: Sizable {
    var reserved: (leading: CGFloat, trailing: CGFloat) { (.zero, .zero) }
    var kernableLeader: CGFloat? { nil }
    var childDirection: LayoutDirection { .horizontal }
    var childSpacing: CGFloat { .zero }
    var childSizables: [any Sizable] { [] }
    var size: Length {
        .exact(CGFloat(pitches.count) * Layout.Advance.gracenoteHead
            + CGFloat(pitches.count - 1) * Layout.gracenoteSeparation
            // :TODO: singlings that are lower than note need more padding
            + Layout.noteGracenoteSeparation)
    }
}

#endif // !os(Linux)
