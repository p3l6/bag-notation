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
        // :TODO: How to center or right justify this text??
        graphics.drawText(tune.header.title, at: box.insetFromTop(x: 100, y: 12), fontSize: 12)
        graphics.drawText(tune.header.composer, at: box.insetFromTop(x: 300, y: 20), fontSize: 12)
        graphics.drawText(styleText, at: box.insetFromTop(x: 0, y: 20), fontSize: 12)
        // :TODO: arranger
        // :TODO: tempo
        // :TODO: revision? in footer of each page? unclear how to do this
    }

    func directChildren() throws -> [any Renderable] {
        let lines = tune.lines
        let boxes = try layout(.vertical, lines, spacing: Layout.staffSeparation)

        var renderables = [LineRenderer]()
        for (index, line) in tune.lines.enumerated() {
            renderables.append(LineRenderer(inside: boxes[index], rendering: line))
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
        .exact(Layout.tuneHeaderHeight) +
            lines.map(\.height).reduce(.exact(0), +)
    }
}

#endif // !os(Linux)
