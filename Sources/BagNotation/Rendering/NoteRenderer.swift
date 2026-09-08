//
//  NoteRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class NoteRenderer: BaseRenderable, Renderable<Note> {
    let note: Note

    init(inside box: BoundingBox, rendering note: Note) {
        self.note = note
        super.init(inside: box)
    }

    private func heightOffset(for pitch: Pitch) -> CGFloat {
        let stepsUp: CGFloat = switch pitch {
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

        return Layout.noteStep * stepsUp
    }

    func render(in graphics: RenderCanvas) {
        if note.pitch == .highA {
            let y = heightOffset(for: .highA)
            graphics.drawLine(from: box.inset(x: -Layout.ledgerLineExtension, y: y),
                              to: box.inset(x: Layout.noteSpacingMin + Layout.ledgerLineExtension, y: y),
                              width: Layout.ledgerLineWidth)
        }

        graphics.drawSymbol(.noteHead, at: box.inset(x: 0,
                                                     y: heightOffset(for: note.pitch)))

        graphics.drawLine(from: box.inset(x: 0,
                                          y: heightOffset(for: note.pitch)),
                          to: box.inset(x: 0,
                                        y: heightOffset(for: note.pitch) - Layout.noteStemIdealHeight),
                          width: Layout.noteStemLineWidth)
    }

    func directChildren() throws -> [any Renderable] {
        []
    }
}

extension Note: Sizable {
    var width: Length { .atLeast(Layout.noteSpacingMin) }
    var height: Length { .full }
}

#endif // !os(Linux)
