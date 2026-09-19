//
//  BarRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class BarRenderer: BaseRenderable, Renderable<Bar> {
    let bar: Bar
    var barlineExtraHeight: CGFloat = 0

    init(inside box: BoundingBox, rendering bar: Bar) {
        self.bar = bar
        super.init(inside: box)
    }

    func render(in _: RenderCanvas) {}

    func directChildren() throws -> [any Renderable] {
        var sizables = [any Sizable]()
        for item in bar.contents {
            switch item {
            case let .cluster(cluster):
                sizables.append(cluster)
            default:
                continue
            }
        }
        sizables.append(bar.trailingBarline)

        var renderables = [any Renderable]()
        for layoutItem in try layout(.horizontal, sizables) {
            switch layoutItem.sizable {
            case let barline as Barline:
                let barlineRenderer = BarlineRenderer(inside: layoutItem.box, rendering: barline)
                barlineRenderer.extraHeight = barlineExtraHeight
                renderables.append(barlineRenderer)
            case let cluster as Cluster:
                renderables.append(ClusterRenderer(inside: layoutItem.box, rendering: cluster))
            default: throw PdfError.unexpectedSizable
            }
        }

        return renderables
    }
}

extension Bar: Sizable {
    var width: Length {
        var width: Length = .zero
        for item in contents {
            switch item {
            case let .cluster(cluster):
                width += cluster.notes.map(\.width)
//            case .rest(let duration):
//                fallthrough
//            case .barRest:
//                fallthrough
//            case .spacer(let duration):
//                fallthrough
//            case .barSpacer:
//                fallthrough
            default: break
            }
        }
        width += trailingBarline.width
        return isPickup ? .exact(width.advance) + .exact(Layout.baseScale) : width
    }

    var height: Length { .full }
}

// MARK: Barline

final class BarlineRenderer: BaseRenderable, Renderable<Barline> {
    let barline: Barline
    var extraHeight: CGFloat = 0

    init(inside box: BoundingBox, rendering barline: Barline) {
        self.barline = barline
        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas) {
        switch barline {
        case .plain:
            graphics.drawLineVert(from: box.inset(x: Layout.barlineLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineLineWidth)
        case .repeatStart:
            graphics.drawLineVert(from: box.inset(x: Layout.barlineThickLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineThickLineWidth)
            graphics.drawLineVert(from: box.inset(x: Layout.barlineThickLineWidth + Layout.barlineSeparation + Layout.barlineLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineLineWidth)
            graphics.drawSymbol(.repeatDots, at: box.insetFromRight(x: Layout.Advance.repeatDots))
        case .repeatEnd:
            graphics.drawSymbol(.repeatDots, at: box.origin)
            graphics.drawLineVert(from: box.inset(x: Layout.Advance.repeatDots + Layout.barlineDotSeparation),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineLineWidth)
            graphics.drawLineVert(from: box.insetFromRight(x: Layout.barlineThickLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineThickLineWidth)
        case .partStart:
            graphics.drawLineVert(from: box.inset(x: Layout.barlineThickLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineThickLineWidth)
            graphics.drawLineVert(from: box.insetFromRight(x: Layout.barlineLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineLineWidth)
        case .partEnd:
            graphics.drawLineVert(from: box.inset(x: Layout.barlineLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineLineWidth)
            graphics.drawLineVert(from: box.insetFromRight(x: Layout.barlineThickLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineThickLineWidth)
        case .double:
            graphics.drawLineVert(from: box.inset(x: Layout.barlineLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineLineWidth)
            graphics.drawLineVert(from: box.insetFromRight(x: Layout.barlineLineWidth / 2),
                                  length: 4 * Layout.staffLineSpacing + extraHeight,
                                  width: Layout.barlineLineWidth)
        }
    }

    func directChildren() throws -> [any Renderable] { [] }
}

extension Barline: Sizable {
    var height: Length { .full }
    var width: Length {
        switch self {
        case .plain:
            .exact(Layout.barlineLineWidth)
        case .double:
            .exact(2 * Layout.barlineLineWidth +
                Layout.barlineSeparation)
        case .partStart, .partEnd:
            .exact(Layout.barlineLineWidth +
                Layout.barlineThickLineWidth +
                Layout.barlineSeparation)
        case .repeatStart, .repeatEnd:
            .exact(Layout.barlineThickLineWidth +
                Layout.barlineSeparation +
                Layout.barlineLineWidth +
                Layout.barlineDotSeparation +
                Layout.Advance.repeatDots)
        }
    }
}
#endif // !os(Linux)
