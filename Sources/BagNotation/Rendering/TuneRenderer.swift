//
//  TuneRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

struct TuneRenderer: Renderable {
    let box: BoundingBox
    let tune: Tune

    func render(in graphics: RenderCanvas, with _: AnchorSet) {
        let titleY = Layout.titleFontSize
        let infoY = titleY + Layout.infoFontSize / 2
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
        try layout(tune).map { layoutItem in
            switch layoutItem.sizable {
            case let line as Line:
                return LineRenderer(box: layoutItem.box, line: line)
            default: throw PdfError.unexpectedSizable
            }
        }
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
    var reserved: (leading: CGFloat, trailing: CGFloat) { (Layout.tuneHeaderHeight, .zero) }
    var kernableLeader: CGFloat? { nil }
    var childDirection: LayoutDirection { .vertical }
    var childSpacing: CGFloat { Layout.staffSeparation }
    var childSizables: [any Sizable] { lines }
    var size: Length { .exact(Layout.tuneHeaderHeight) + totalChildSize }
}

#endif // !os(Linux)
