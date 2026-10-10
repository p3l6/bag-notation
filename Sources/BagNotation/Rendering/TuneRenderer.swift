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
        reservedLeading = Layout.tuneHeaderHeight
    }

    func render(in graphics: RenderCanvas, with _: AnchorSet) {
        let titleY = Layout.titleFontSize
        let infoY = titleY + Layout.infoFontSize
        let detailY = infoY + Layout.detailFontSize + 3

        graphics.drawText(tune.header.title, at: box.insetFromTop(x: box.width / 2, y: titleY), fontSize: Layout.titleFontSize, kind: .italic, justify: .center)

        graphics.drawText(tune.header.composer, at: box.insetFromTopRight(y: infoY), fontSize: Layout.infoFontSize, justify: .right)
        graphics.drawText(styleText, at: box.insetFromTop(y: infoY), fontSize: Layout.infoFontSize)

        if let tempo = tune.header.tempo {
            graphics.drawText("\(tempo) bpm", at: box.insetFromTop(y: detailY), fontSize: Layout.detailFontSize)
        }

        if let arr = tune.header.arranger {
            graphics.drawText("Arr: \(arr)", at: box.insetFromTopRight(y: detailY), fontSize: Layout.detailFontSize, justify: .right)
        }
    }

    func directChildren() throws -> [any Renderable] {
        let lines = tune.lines

        var renderables = [LineRenderer]()
        for layoutItem in try layout(.vertical, lines, spacing: Layout.staffSeparation) {
            switch layoutItem.sizable {
            case let line as Line:
                renderables.append(LineRenderer(inside: layoutItem.box, rendering: line))
            default: throw PdfError.unexpectedSizable
            }
        }

        return renderables
    }

    fileprivate var styleText: String {
        switch tune.header.style {
        case .march: "March"
        case .hornpipe: "Hornpipe"
        case .jig: "Jig"
        case .reel: "Reel"
        case .strathspey: "Strathspey"
        case .slowAir: "Slow Air"
        case .slowMarch: "Slow March"
        case .piob: "Piobaireachd"
        case .waulk: "Waulking Song"
        case .waltz: "Waltz"
        case .hymn: "Hymn"
        }
    }
}

extension Tune: Sizable {
    var kernableLeader: CGFloat? { nil }
    var width: Length { .full }
    var height: Length {
        .exact(Layout.tuneHeaderHeight)
            + lines.map(\.height).sum
            + .exact(Layout.staffSeparation * CGFloat(lines.count - 1))
    }
}

#endif // !os(Linux)
