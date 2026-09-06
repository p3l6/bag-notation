//
//  NoteRenderer.swift
//  Bag Notation
//

import CoreGraphics

final class NoteRenderer: BaseRenderable, Renderable<Note> {
    let note: Note

    init(inside boundingBox: BoundingBox, rendering note: Note) {
        self.note = note
        super.init(inside: boundingBox)
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
        // todo leger lines

        graphics.drawSymbol("\u{E0A4}", at: CGPoint(x: boundingBox.left + LayoutConstants.noteSpacingMin / 2,
                                                    y: boundingBox.bottom + heightOffset(for: note.pitch)))

        graphics.drawLine(from: CGPoint(x: boundingBox.left + LayoutConstants.noteSpacingMin / 2,
                                        y: boundingBox.bottom + heightOffset(for: note.pitch)),
                          to: CGPoint(x: boundingBox.left + LayoutConstants.noteSpacingMin / 2,
                                      y: boundingBox.bottom + heightOffset(for: note.pitch) - LayoutConstants.noteStemIdealHeight),
                          width: LayoutConstants.noteStemLineWidth)
    }

    func directChildren() throws -> [any Renderable] {
        []
    }
}

extension Note: Sizable {
    var alignLeading: Bool { true }
    var width: StretchyWidth { .atLeast(LayoutConstants.noteSpacingMin) }
    var heightRequirement: StretchyWidth { .full }
}
