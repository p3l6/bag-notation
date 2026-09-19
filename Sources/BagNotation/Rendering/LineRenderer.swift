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
        guard line.voices.count > 1 else { return }
        // :TODO: Consider drawing U+E004 and U+E003 to make a bracket in addition / instead
        graphics.drawLineVert(from: CGPoint(x: box.left + Layout.barlineLineWidth / 2, y: box.bottom),
                              length: box.height - Layout.staffLineSpacing * 3,
                              width: Layout.barlineLineWidth)
    }

    func directChildren() throws -> [any Renderable] {
        var previousVoiceBox: BoundingBox?
        var renderables = [VoiceRenderer]()

        for  layoutItem in try layout(.vertical, line.voices, spacing: Layout.staffJoinedSeparation) {
            guard let voice = layoutItem.sizable as? Voice else {
                throw PdfError.unexpectedSizable
            }

            let voiceRenderer = VoiceRenderer(inside: layoutItem.box, rendering: voice)
            if let previousVoiceBox {
                voiceRenderer.barlineExtraHeight = previousVoiceBox.bottom -  layoutItem.box.bottom - 4 * Layout.staffLineSpacing
            }
            previousVoiceBox = layoutItem.box
            renderables.append(voiceRenderer)
        }

        if renderables.count > 1, let firstRenderer = renderables.first {
            let widths = try sharedItemWidths(availableWidth: box.width - firstRenderer.reservedLeading - firstRenderer.reservedTrailing)
            for renderer in renderables {
                renderer.predefinedLayoutSizes = widths
            }
        }

        return renderables
    }

    private func sharedItemWidths(availableWidth: CGFloat) throws -> [CGFloat] {
        let barCount = line.melody.context.barCount
        guard line.voices.allSatisfy({ $0.bars.count == barCount }) else {
            // :TODO: Make this a parse error when loading document, also
            throw PdfError.inconsistentVoiceLayout
        }

        var maxBarPerGroup = [Bar]()
        for barIndex in line.melody.bars.indices {
            let bars = line.voices.map { $0.bars[barIndex] }
            maxBarPerGroup.append(bars.max(by: ({$0.width.advance > $1.width.advance}))!)
        }

        var sizeables: [any Sizable] = maxBarPerGroup
        if let leadingBarline = line.melody.leadingBarline {
            sizeables.insert(leadingBarline, at: 0)
        }
        return try stretch(.horizontal, sizeables, in: availableWidth)
    }
}

extension Line: Sizable {
    var width: Length { .full }

    var height: Length {
        voices.map(\.height).sum
        + .exact(Layout.staffJoinedSeparation * CGFloat(voices.count - 1))
    }
}

#endif // !os(Linux)
