//
//  LineRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class LineRenderer: BaseRenderable, Renderable<Line> {
    let line: Line

    init(inside box: BoundingBox, rendering line: Line) {
        self.line = line
        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas) {
        //// :TODO:  draw cleff, etc

        for lineIndex in 0 ..< 5 {
            let y = box.bottom + CGFloat(lineIndex) * LayoutConstants.staffLineSpacing
            graphics.drawLine(from: CGPoint(x: box.left, y: y),
                              to: CGPoint(x: box.left + box.width, y: y),
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
        let boxes = try layout(.horizontal, notes)
        return notes.enumerated().map { index, note in
            NoteRenderer(inside: boxes[index], rendering: note)
        }
    }
}

extension Line: Sizable {
    var alignLeading: Bool { true }
    var width: Length { .full }
    var height: Length { .exact(LayoutConstants.staffLineSpacing * 6) }
}

#endif // !os(Linux)
