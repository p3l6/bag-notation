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

        reservedLeading = Layout.Advance.gClef
    }

    func render(in graphics: RenderCanvas) {
        for lineIndex in 0 ..< 5 {
            let y = box.bottom + CGFloat(lineIndex) * Layout.staffLineSpacing
            graphics.drawLine(from: CGPoint(x: box.left, y: y),
                              to: CGPoint(x: box.right, y: y),
                              width: Layout.staffLineWidth)
        }

        graphics.drawSymbol(.gClef, at: box.inset(x: 1, y: Layout.staffLineSpacing))
    }

    func directChildren() throws -> [any Renderable] {
        var items = [any Sizable]()
        var hasLeadingBarline = false
        if let leadingLine = line.melody.leadingBarline {
            items.append(leadingLine)
            hasLeadingBarline = true
        }
        let bars = line.voices.first!.bars
        items.append(contentsOf: bars)

        let boxes = try layout(.horizontal, items)
        var renderables = [any Renderable]()
        if hasLeadingBarline {
            renderables.append(BarlineRenderer(inside: boxes[0], rendering: line.melody.leadingBarline!))
        }
        for (index, bar) in bars.enumerated() {
            let boxIndex = index + (hasLeadingBarline ? 1 : 0)
            renderables.append(BarRenderer(inside: boxes[boxIndex], rendering: bar))
        }
        return renderables
    }
}

extension Line: Sizable {
    var width: Length { .full }
    var height: Length { .exact(Layout.staffLineSpacing * 6) }
}

#endif // !os(Linux)
