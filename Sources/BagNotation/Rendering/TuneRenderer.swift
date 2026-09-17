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

    func render(in graphics: RenderCanvas) {
        graphics.drawText(tune.header.title, at: box.insetFromTop(x: box.width / 2, y: 20), fontSize: 20, kind: .italic, justify: .center)
        graphics.drawText(tune.header.composer, at: box.insetFromTopRight(y: 30), fontSize: 10, justify: .right)
        if let arr = tune.header.arranger {
            graphics.drawText("Arr: \(arr)", at: box.insetFromTopRight(y: 42), fontSize: 9, justify: .right)
        }
        graphics.drawText(styleText, at: box.insetFromTop(y: 30), fontSize: 10)
        if let tempo = tune.header.tempo {
            graphics.drawText("\(tempo) bpm", at: box.insetFromTop(y: 42), fontSize: 9)
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

        renderables.first!.setTimeSignature(tune.header.timeSignature)
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
    var width: Length { .full }
    var height: Length {
        .exact(Layout.tuneHeaderHeight)
            + lines.map(\.height).sum
            + .exact(Layout.staffSeparation * CGFloat(lines.count))
    }
}

#endif // !os(Linux)
