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

    func render(in _: RenderCanvas) {}

    func directChildren() throws -> [any Renderable] {
        var items: [any Sizable] = [tune.header]
        items.append(contentsOf: tune.lines)
        let boxes = try layout(.vertical, items, spacing: LayoutConstants.staffSpacing)

        var renderables = [any Renderable]()
        renderables.append(HeaderRenderer(inside: boxes[0], rendering: tune.header))
        for (index, line) in tune.lines.enumerated() {
            renderables.append(LineRenderer(inside: boxes[index + 1], rendering: line))
        }
        return renderables
    }
}

extension Tune: Sizable {
    var alignLeading: Bool { true }
    var width: Length { .full }
    var height: Length {
        header.height +
            lines.map(\.height).reduce(.exact(0), +)
    }
}

// MARK: Header

final class HeaderRenderer: BaseRenderable, Renderable<Header> {
    let header: Header

    init(inside box: BoundingBox, rendering header: Header) {
        self.header = header
        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas) {
        // :TODO: How to center or right justify this text??
        graphics.drawText(header.title, at: box.insetFromTop(x: 100, y: 12), fontSize: 12)
        graphics.drawText(header.composer, at: box.insetFromTop(x: 300, y: 20), fontSize: 12)
        graphics.drawText(styleText, at: box.insetFromTop(x: 0, y: 20), fontSize: 12)
        // :TODO: arranger
        // :TODO: tempo
        // :TODO: revision? in footer of each page? unclear how to do this
    }

    func directChildren() throws -> [any Renderable] { [] }

    fileprivate var styleText: String {
        switch header.style {
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

extension Header: Sizable {
    var alignLeading: Bool { true }
    var width: Length { .full }
    var height: Length {
        .exact(LayoutConstants.tuneHeaderHeight)
    }
}

#endif // !os(Linux)
