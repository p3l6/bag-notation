//
//  VoiceRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class VoiceRenderer: BaseRenderable, Renderable<Voice> {
    let voice: Voice
    private var timeSignature: TimeSignature?
    var barlineExtraHeight: CGFloat = 0

    init(inside box: BoundingBox, rendering voice: Voice) {
        self.voice = voice
        super.init(inside: box)

        reservedLeading = Layout.Advance.gClef + Layout.baseScale

        if voice.context.line.lineNumber == 1 {
            timeSignature = voice.bars.first?.context.timeSignature
            reservedLeading += Layout.Advance.timeSig

            if timeSignature == .time128 {
                reservedLeading += Layout.Advance.timeSig
            }
        }
    }

    func render(in graphics: RenderCanvas, with anchors: AnchorSet) throws {
        // Staff lines
        for lineIndex in 0 ..< 5 {
            let y = box.bottom + CGFloat(lineIndex) * Layout.staffLineSpacing
            graphics.drawLine(from: CGPoint(x: box.left, y: y),
                              to: CGPoint(x: box.right, y: y),
                              width: Layout.staffLineWidth)
        }

        // Clef
        graphics.drawSymbol(.gClef, at: box.inset(x: 1, y: Layout.staffLineSpacing))

        // Time signature
        if let timeSignature {
            let (top, bottom) = timeSignature.symbols
            let bottomXExtra = timeSignature == .time128 ? Layout.Advance.timeSig / 2 : 0

            graphics.drawSymbol(top, at: box.inset(x: Layout.Advance.gClef + Layout.baseScale / 2, y: 3 * Layout.baseScale))
            graphics.drawSymbol(bottom, at: box.inset(x: Layout.Advance.gClef + Layout.baseScale / 2 + bottomXExtra, y: 1 * Layout.baseScale))
        }

        // Variations
        var horizStart: CGFloat?
        for anchor in try variationAnchors(set: anchors) {
            let y = box.top - Layout.variationBracketLineWidth / 2

            if let x = anchor.startX {
                horizStart = horizStart ?? x
                graphics.drawLineVert(from: CGPoint(x: x, y: y),
                                      length: -Layout.variationBracketHeight,
                                      width: Layout.variationBracketLineWidth)
                if let label = anchor.label {
                    let fontSize = Layout.variationBracketHeight - Layout.baseScale / 2
                    graphics.drawText(label,
                                      at: CGPoint(x: x + Layout.baseScale,
                                                  y: y - fontSize),
                                      fontSize: fontSize)
                }
            }

            if let x = anchor.endX, let horizStart {
                graphics.drawLineVert(from: CGPoint(x: x, y: y),
                                      length: -Layout.variationBracketHeight,
                                      width: Layout.variationBracketLineWidth)
                graphics.drawLineHoriz(from: CGPoint(x: horizStart, y: y),
                                       length: x - horizStart,
                                       width: Layout.variationBracketLineWidth)
            }
        }

        // Grouping connector swoops
        for swoop in try connectionAnchors(set: anchors) {
            graphics.drawCurveQ(from: swoop.start,
                                control: offsetMidpoint(a: swoop.start, b: swoop.end, d: Layout.connectionArcHeight),
                                to: swoop.end,
                                width: Layout.connectionLineWidth)
            if let label = swoop.label {
                graphics.drawText(label,
                                  at: CGPoint(x: (swoop.start.x + swoop.end.x) / 2,
                                              y: (swoop.start.y + swoop.end.y) / 2 + Layout.connectionArcHeight + Layout.connectionLabelSeparation),
                                  fontSize: Layout.connectionFontSize,
                                  justify: .center)

            }
        }
    }

    func directChildren() throws -> [any Renderable] {
        var sizables = [any Sizable]()
        if let leadingLine = voice.leadingBarline {
            sizables.append(leadingLine)
        }
        sizables.append(contentsOf: voice.bars)

        var renderables = [any Renderable]()
        for layoutItem in try layout(.horizontal, sizables) {
            switch layoutItem.sizable {
            case let barline as Barline:
                let barlineRenderer = BarlineRenderer(inside: layoutItem.box, rendering: barline)
                barlineRenderer.extraHeight = barlineExtraHeight
                renderables.append(barlineRenderer)
            case let bar as Bar:
                let barRenderer = BarRenderer(inside: layoutItem.box, rendering: bar)
                barRenderer.barlineExtraHeight = barlineExtraHeight
                renderables.append(barRenderer)
            default: throw PdfError.unexpectedSizable
            }
        }

        return renderables
    }

    func variationAnchors(set: AnchorSet) throws -> [VariationAnchor] {
        let clusters = voice.bars.flatMap { $0.contents.compactMap { if case let .cluster(c) = $0 { c } else { nil }} }
        return try clusters.compactMap { cluster throws -> VariationAnchor? in
            guard !cluster.variation.isContinuation else { return nil }
            let anchors = try set.anchors(for: cluster)
            return try VariationAnchor(clusterLeft: anchors.start,
                                       clusterRight: anchors.end,
                                       variation: cluster.variation)
        }
    }

    func connectionAnchors(set: AnchorSet) throws -> [Swoop] {
        let clusters = voice.bars.flatMap { $0.contents.compactMap { if case let .cluster(c) = $0 { c } else { nil }} }
        let notes = clusters.flatMap { $0.notes }

        var connections = [Swoop]()
        var openConnection: (kind: NoteGrouping.Kind, start: Note.Anchors)?

        for note in notes {
            let anchors = try set.anchors(for: note)
            switch note.grouping {
            case let .start(kind):
                openConnection = (kind, anchors)
            case let .end(kind):
                if let openConnection {
                    connections.append(Swoop(kind, from: openConnection.start, to: anchors))
                } else {
                    connections.append(Swoop(kind, wrappedFrom: box.left + reservedLeading, to: anchors))
                }
                openConnection = nil
            case let .transition(ending: ending, starting: starting):
                if let openConnection {
                    connections.append(Swoop(ending, from: openConnection.start, to: anchors))
                } else {
                    connections.append(Swoop(ending, wrappedFrom: box.left + reservedLeading, to: anchors))
                }
                openConnection = (starting, anchors)
            default:
                break
            }
        }

        if let openConnection {
            connections.append(Swoop(openConnection.kind,  from: openConnection.start, wrappedAt: box.right))
        }
        return connections
    }
}

extension Voice: Sizable {
    var width: Length { .full }
    var height: Length {
        .exact(Layout.staffLineSpacing * 7) +
            // :TODO: somehow kern this into the staff separation buffer
            (hasAnyVariations ? .exact(Layout.variationBracketHeight) : .zero)
    }

    private var hasAnyVariations: Bool {
        bars.flatMap(\.contents)
            .compactMap { if case let .cluster(cluster) = $0 { cluster } else { nil } }
            .contains { !$0.variation.isContinuation }
    }
}

struct VariationAnchor {
    let label: String?
    let startX: CGFloat?
    let endX: CGFloat?
    let breakHorizLine: Bool

    init(clusterLeft: CGFloat, clusterRight: CGFloat, variation: Variation) throws {
        switch variation {
        case .none, .active:
            throw PdfError.unexpectedVariationAnchor
        case let .start(label):
            self.label = label
            startX = clusterLeft
            endX = nil
            breakHorizLine = false
        case let .startAndEnd(label):
            self.label = label
            startX = clusterLeft
            endX = clusterRight
            breakHorizLine = true
        case .end:
            endX = clusterRight
            breakHorizLine = true
            startX = nil
            label = nil
        }
    }
}

struct Swoop {
    let start: CGPoint
    let end: CGPoint
    var label: String?

    init(_ kind: NoteGrouping.Kind, from start: Note.Anchors, to end: Note.Anchors) {
        label = if case let .tuplet(size) = kind { String(size) } else { nil }

        self.start = CGPoint(x: start.noteheadRight, y: start.noteheadTop + Layout.connectionNoteSeparation)
        self.end = CGPoint(x: end.noteheadLeft, y: end.noteheadTop + Layout.connectionNoteSeparation)
    }

    init(_ kind: NoteGrouping.Kind, wrappedFrom start: CGFloat, to end: Note.Anchors) {
        label = if case let .tuplet(size) = kind { String(size) } else { nil }

        let y = end.noteheadTop + Layout.connectionNoteSeparation
        self.start = CGPoint(x: start, y: y)
        self.end = CGPoint(x: end.noteheadLeft, y: y)
    }

    init(_ kind: NoteGrouping.Kind, from start: Note.Anchors, wrappedAt end: CGFloat) {
        label = if case let .tuplet(size) = kind { String(size) } else { nil }

        let y = start.noteheadTop + Layout.connectionNoteSeparation
        self.start = CGPoint(x: start.noteheadRight, y: y)
        self.end = CGPoint(x: end, y: y)
    }
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
