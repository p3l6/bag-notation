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

        return LayoutConstants.noteStep * stepsUp
    }

    func render(in graphics: RenderCanvas) {
        if note.pitch == .highA {
            let y = heightOffset(for: .highA)
            graphics.drawLine(from: box.inset(x: LayoutConstants.noteSpacingMin / 2 - 4, y: y),
                              to: box.inset(x: 12 + LayoutConstants.noteSpacingMin / 2, y: y),
                              width: LayoutConstants.staffLineWidth)
        }

        graphics.drawSymbol(.noteHead, at: box.inset(x: LayoutConstants.noteSpacingMin / 2,
                                                     y: heightOffset(for: note.pitch)))

        graphics.drawLine(from: box.inset(x: LayoutConstants.noteSpacingMin / 2,
                                          y: heightOffset(for: note.pitch)),
                          to: box.inset(x: LayoutConstants.noteSpacingMin / 2,
                                        y: heightOffset(for: note.pitch) - LayoutConstants.noteStemIdealHeight),
                          width: LayoutConstants.noteStemLineWidth)
    }

    func directChildren() throws -> [any Renderable] {
        []
    }
}

extension Note: Sizable {
    var alignLeading: Bool { true }
    var width: Length { .atLeast(LayoutConstants.noteSpacingMin) }
    var height: Length { .full }
}

#endif // !os(Linux)
