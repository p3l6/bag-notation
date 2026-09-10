//
//  LineRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class LineRenderer: BaseRenderable, Renderable<Line> {
    let line: Line
    private var timeSignature: TimeSignature?

    init(inside box: BoundingBox, rendering line: Line) {
        self.line = line
        super.init(inside: box)

        reservedLeading = Layout.Advance.gClef + Layout.baseScale
    }

    func render(in graphics: RenderCanvas) {
        for lineIndex in 0 ..< 5 {
            let y = box.bottom + CGFloat(lineIndex) * Layout.staffLineSpacing
            graphics.drawLine(from: CGPoint(x: box.left, y: y),
                              to: CGPoint(x: box.right, y: y),
                              width: Layout.staffLineWidth)
        }

        graphics.drawSymbol(.gClef, at: box.inset(x: 1, y: Layout.staffLineSpacing))

        if let timeSignature {
            let (top, bottom) = timeSignature.symbols
            let bottomXExtra = timeSignature == .time128 ? Layout.Advance.timeSig / 2 : 0

            graphics.drawSymbol(top, at: box.inset(x: Layout.Advance.gClef + Layout.baseScale / 2, y: 3 * Layout.baseScale))
            graphics.drawSymbol(bottom, at: box.inset(x: Layout.Advance.gClef + Layout.baseScale / 2 + bottomXExtra, y: 1 * Layout.baseScale))
        }
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

    func setTimeSignature(_ timeSignature: TimeSignature) {
        self.timeSignature = timeSignature
        reservedLeading += Layout.Advance.timeSig

        if timeSignature == .time128 {
            reservedLeading += Layout.Advance.timeSig
        }
    }
}

extension Line: Sizable {
    var width: Length { .full }
    var height: Length { .exact(Layout.staffLineSpacing * 6) }
}

extension TimeSignature {
    var symbols: (BravuraSymbol, BravuraSymbol) {
        switch self {
        case .time22: (.timeSig2, .timeSig2)
        case .time24: (.timeSig2, .timeSig4)
        case .time32: (.timeSig3, .timeSig2)
        case .time34: (.timeSig3, .timeSig4)
        case .time44: (.timeSig4, .timeSig4)
        case .time54: (.timeSig5, .timeSig4)
        case .time64: (.timeSig6, .timeSig4)
        case .time68: (.timeSig6, .timeSig8)
        case .time98: (.timeSig9, .timeSig8)
        case .time128: (.timeSig12, .timeSig8)
        }
    }
}

#endif // !os(Linux)
