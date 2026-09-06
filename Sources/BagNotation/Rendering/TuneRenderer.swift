//
//  TuneRenderer.swift
//  Bag Notation
//

import CoreGraphics

final class TuneRenderer: BaseRenderable, Renderable<Tune> {
    //// :TODO: might need to make a class for just this: let sizeOfSomething = 400.0
    // or the constants come in a context thing
    // need this info for sizing as well..

    let tune: Tune

    init(inside boundingBox: BoundingBox, rendering tune: Tune) {
        self.tune = tune
        super.init(inside: boundingBox)
    }

    func render(in _: RenderCanvas) {
        // draw header
    }

    func directChildren() throws -> [any Renderable] {
        let lines = tune.lines
        let boxes = try layoutVertically(lines, insideMargin: LayoutConstants.staffSpacing)
        //// :TODO: assert counts are equal
        return lines.enumerated().map { index, line in
            LineRenderer(inside: boxes[index], rendering: line)
        }
    }
}

extension Tune: Sizable {
    var alignLeading: Bool { true }
    var width: StretchyWidth { .full }
    var heightRequirement: StretchyWidth {
        // :TODO: need addition operators on stretchy type
        lines.first!.heightRequirement
    }
}
