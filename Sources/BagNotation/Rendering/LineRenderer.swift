//
//  LineRenderer.swift
//  Bag Notation
//

import CoreGraphics

final class LineRenderer: BaseRenderable, Renderable<Line> {
    let line: Line

    init(inside boundingBox: BoundingBox, rendering line: Line) {
        self.line = line
        super.init(inside: boundingBox)
    }

    func render(in graphics: RenderCanvas) {
        //// :TODO:  draw cleff, etc

        for lineIndex in 0 ..< 5 {
            let y = boundingBox.bottom + CGFloat(lineIndex) * LayoutConstants.staffLineSpacing
            graphics.drawLine(from: CGPoint(x: boundingBox.left, y: y),
                              to: CGPoint(x: boundingBox.left + boundingBox.width, y: y),
                              width: LayoutConstants.staffLineWidth)
        }
    }

    func directChildren() throws -> [any Renderable] {
        var notes = [] as [Note]
        for note in line.voices.first!.bars.first!.contents {
            switch note {
            case let .cluster(c):
                notes.append(contentsOf: c.notes)
            default:
                continue
            }
        }
        let boxes = try layoutHorizontally(notes)
        return notes.enumerated().map { index, note in
            NoteRenderer(inside: boxes[index], rendering: note)
        }
    }
}

extension Line: Sizable {
    var alignLeading: Bool { true }
    var width: StretchyWidth { .full }
    var heightRequirement: StretchyWidth { .exact(LayoutConstants.staffLineSpacing * 6) }
}
