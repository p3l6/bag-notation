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
//        Maybe, if instead of having a dedicated renderer object just for the cleff,
//        the layout algorithm can be told to skip some amount of leading space?
//        This would simplify the tune header as well.
//        Maybe trailing barlines? if I did trailing skips?

        for lineIndex in 0 ..< 5 {
            let y = box.bottom + CGFloat(lineIndex) * LayoutConstants.staffLineSpacing
            graphics.drawLine(from: CGPoint(x: box.left, y: y),
                              to: CGPoint(x: box.left + box.width, y: y),
                              width: LayoutConstants.staffLineWidth)
        }
    }

    func directChildren() throws -> [any Renderable] {
        let bars = line.voices.first!.bars
        let boxes = try layout(.horizontal, bars)
        return bars.enumerated().map { index, bar in
            BarRenderer(inside: boxes[index], rendering: bar)
        }
    }
}

extension Line: Sizable {
    var alignLeading: Bool { true }
    var width: Length { .full }
    var height: Length { .exact(LayoutConstants.staffLineSpacing * 6) }
}

#endif // !os(Linux)
