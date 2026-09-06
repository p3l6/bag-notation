//
//  TuneRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class TuneRenderer: BaseRenderable, Renderable<Tune> {
    let tune: Tune

    init(inside box: BoundingBox, rendering tune: Tune) {
        self.tune = tune
        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas) {
        graphics.drawText("Tune Title", at: box.insetFromTop(x: 50, y: 20), fontSize: 12)
    }

    func directChildren() throws -> [any Renderable] {
        let lines = tune.lines
        let boxes = try layout(.vertical, lines, spacing: LayoutConstants.staffSpacing)
        return lines.enumerated().map { index, line in
            LineRenderer(inside: boxes[index], rendering: line)
        }
    }
}

extension Tune: Sizable {
    var alignLeading: Bool { true }
    var width: Length { .full }
    var height: Length {
        // :TODO: need addition operators on stretchy type
        lines.first!.height
    }
}

#endif // !os(Linux)
