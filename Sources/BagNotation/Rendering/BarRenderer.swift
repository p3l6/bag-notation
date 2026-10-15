//
//  BarRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

struct BarRenderer: Renderable {
    let box: BoundingBox
    let bar: Bar
    let barlineExtraHeight: CGFloat

    func render(in _: RenderCanvas, with _: AnchorSet) {}

    func directChildren() throws -> [any Renderable] {
        try layout(bar).map { layoutItem in
            switch layoutItem.sizable {
            case let timeSignature as TimeSignature:
                TimeSignatureRenderer(box: layoutItem.box, timeSignature: timeSignature)
            case let barline as Barline:
                BarlineRenderer(box: layoutItem.box, barline: barline, extraHeight: barlineExtraHeight)
            case let cluster as Cluster:
                ClusterRenderer(box: layoutItem.box, cluster: cluster)
            case let rest as Rest:
                RestRenderer(box: layoutItem.box, rest: rest)
            default: throw PdfError.unexpectedSizable
            }
        }
    }
}

extension Bar: Sizable {
    var reserved: (leading: CGFloat, trailing: CGFloat) { (.zero, .zero) }
    var kernableLeader: CGFloat? { nil }
    var childDirection: LayoutDirection { .horizontal }
    var childSpacing: CGFloat { .zero }
    var childSizables: [any Sizable] {
        var sizables = [any Sizable]()
        if context.timeSignatureChanged {
            sizables.append(context.timeSignature)
        }
        for item in contents {
            switch item {
            case let .cluster(cluster):
                sizables.append(cluster)
            case let .rest(duration):
                sizables.append(Rest.duration(duration))
            case .barRest:
                sizables.append(Rest.bar)
            case .barSpacer:
                sizables.append(Rest.emptyBar)
            default:
                continue
            }
        }

        if contents.isEmpty {
            sizables.append(Rest.emptyBar)
        }

        sizables.append(trailingBarline)
        return sizables
    }

    var size: Length { isPickup ? .exact(totalChildSize.advance) + .exact(2 * Layout.baseScale) : totalChildSize }
}

// MARK: Rest

private enum Rest: Sizable {
    case duration(Duration)
    case bar
    case emptyBar

    var reserved: (leading: CGFloat, trailing: CGFloat) { (.zero, .zero) }
    var kernableLeader: CGFloat? { nil }
    var childDirection: LayoutDirection { .horizontal }
    var childSpacing: CGFloat { .zero }
    var childSizables: [any Sizable] { [] }
    var size: Length {
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

private struct RestRenderer: Renderable {
    let box: BoundingBox
    let rest: Rest

    func render(in graphics: RenderCanvas, with _: AnchorSet) {
        let x = (box.width - rest.size.advance) / 2
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

struct BarlineRenderer: Renderable {
    let box: BoundingBox
    let barline: Barline
    let extraHeight: CGFloat

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
    var reserved: (leading: CGFloat, trailing: CGFloat) { (.zero, .zero) }
    var kernableLeader: CGFloat? { nil }
    var childDirection: LayoutDirection { .horizontal }
    var childSpacing: CGFloat { .zero }
    var childSizables: [any Sizable] { [] }
    var size: Length {
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
