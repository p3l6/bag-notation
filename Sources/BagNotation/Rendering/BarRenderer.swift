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

    func render(in _: RenderCanvas, with _: AnchorSet) {}

    func directChildren() throws -> [any Renderable] {
        var sizables = [any Sizable]()
        if bar.context.timeSignatureChanged {
            sizables.append(bar.context.timeSignature)
        }
        for item in bar.contents {
            switch item {
            case let .cluster(cluster):
                sizables.append(cluster)
            case let .rest(duration):
                sizables.append(Rest.duration(duration))
            case .barRest:
                sizables.append(Rest.bar)
            default:
                continue
            }
        }

        if bar.contents.isEmpty {
            sizables.append(Rest.emptyBar)
        }

        sizables.append(bar.trailingBarline)

        var renderables = [any Renderable]()
        for layoutItem in try layout(.horizontal, sizables) {
            switch layoutItem.sizable {
            case let timeSignature as TimeSignature:
                renderables.append(TimeSignatureRenderer(inside: layoutItem.box, rendering: timeSignature))
            case let barline as Barline:
                let barlineRenderer = BarlineRenderer(inside: layoutItem.box, rendering: barline)
                barlineRenderer.extraHeight = barlineExtraHeight
                renderables.append(barlineRenderer)
            case let cluster as Cluster:
                renderables.append(ClusterRenderer(inside: layoutItem.box, rendering: cluster))
            case let rest as Rest:
                renderables.append(RestRenderer(inside: layoutItem.box, rendering: rest))
            default: throw PdfError.unexpectedSizable
            }
        }

        return renderables
    }
}

extension Bar: Sizable {
    var kernableLeader: CGFloat? { nil }
    var height: Length { .full }
    var width: Length {
        var width: Length = context.timeSignatureChanged ? context.timeSignature.width : .zero
        for item in contents {
            switch item {
            case let .cluster(cluster):
                width += cluster.notes.map(\.width)
            case let .rest(duration):
                width += Rest.duration(duration).width
            case .barRest:
                width += Rest.bar.width
            default: break
            }
        }
        width += trailingBarline.width
        return isPickup ? .exact(width.advance) + .exact(Layout.baseScale) : .atLeast(width.advance)
    }
}

// MARK: Rest

private enum Rest: Sizable {
    case duration(Duration)
    case bar
    case emptyBar

    var kernableLeader: CGFloat? { nil }
    var height: Length { .full }
    var width: Length {
        var advance = symbolAdvance
        if case let .duration(duration) = self, duration.isDotted {
            advance += Layout.noteDotSeparation + Layout.Advance.noteDot
        }
        return .atLeast(advance)
    }

    var symbol: BravuraSymbol? {
        switch self {
        case .bar: .restHBar
        case .emptyBar: nil
        case .duration(.whole), .duration(.wholeDotted): .restWhole
        case .duration(.half), .duration(.halfDotted): .restHalf
        case .duration(.quarter), .duration(.quarterDotted): .restQuarter
        case .duration(.eighth), .duration(.eighthDotted): .restEighth
        case .duration(.sixteenth), .duration(.sixteenthDotted): .rest16th
        case .duration(.thirtysecond), .duration(.thirtysecondDotted): .rest32nd
        case .duration(.sixtyfourth), .duration(.sixtyfourthDotted): .rest64th
        }
    }

    var symbolAdvance: CGFloat {
        switch self {
        case .bar, .emptyBar: Layout.Advance.restHBar
        case .duration(.whole), .duration(.wholeDotted): Layout.Advance.restWhole
        case .duration(.half), .duration(.halfDotted): Layout.Advance.restHalf
        case .duration(.quarter), .duration(.quarterDotted): Layout.Advance.restQuarter
        case .duration(.eighth), .duration(.eighthDotted): Layout.Advance.restEighth
        case .duration(.sixteenth), .duration(.sixteenthDotted): Layout.Advance.rest16th
        case .duration(.thirtysecond), .duration(.thirtysecondDotted): Layout.Advance.rest32nd
        case .duration(.sixtyfourth), .duration(.sixtyfourthDotted): Layout.Advance.rest64th
        }
    }
}

private final class RestRenderer: BaseRenderable, Renderable<Rest> {
    let rest: Rest

    init(inside box: BoundingBox, rendering rest: Rest) {
        self.rest = rest
        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas, with _: AnchorSet) {
        let x = (box.width - rest.width.advance) / 2
        let y = 4 * Layout.noteStep
        if let symbol = rest.symbol {
            graphics.drawSymbol(symbol, at: box.inset(x: x, y: y))
        }

        if case let .duration(duration) = rest, duration.isDotted {
            graphics.drawSymbol(.dotted, at: box.inset(
                x: x + rest.symbolAdvance + Layout.noteDotSeparation,
                y: y))
        }
    }

    func directChildren() throws -> [any Renderable] { [] }
}

// MARK: Barline

final class BarlineRenderer: BaseRenderable, Renderable<Barline> {
    let barline: Barline
    var extraHeight: CGFloat = 0

    init(inside box: BoundingBox, rendering barline: Barline) {
        self.barline = barline
        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas, with _: AnchorSet) {
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
    var kernableLeader: CGFloat? { nil }
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
