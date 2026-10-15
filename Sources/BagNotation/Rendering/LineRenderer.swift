//
//  LineRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

struct LineRenderer: Renderable {
    let box: BoundingBox
    let line: Line

    func render(in graphics: RenderCanvas, with _: AnchorSet) {
        guard line.voices.count > 1 else { return }
        // :TODO: Consider drawing U+E004 and U+E003 to make a bracket in addition / instead
        graphics.drawLineVert(from: CGPoint(x: box.left + Layout.barlineLineWidth / 2, y: box.bottom),
                              // :TODO: If the first voice has a variation, this is too high
                              length: box.height - Layout.staffLineSpacing * 3,
                              width: Layout.barlineLineWidth)
    }

    func directChildren() throws -> [any Renderable] {
        var previousVoiceBox: BoundingBox?
        var renderables = [VoiceRenderer]()

        var alignedWidths: [CGFloat]?
        if line.voices.count > 1, let firstVoice = line.voices.first {
            let alignment = try BarAlignment(line: line, availableSpace: box.width - firstVoice.reserved.leading - firstVoice.reserved.trailing)
            alignedWidths = try alignment.stretchChildren(in: alignment.availableSpace).map(\.size)
        }

        for layoutItem in try layout(line) {
            guard let voice = layoutItem.sizable as? Voice else {
                throw PdfError.unexpectedSizable
            }

            let barlineHeight = if let previousVoiceBox {
                previousVoiceBox.bottom - layoutItem.box.bottom - 4 * Layout.staffLineSpacing
            } else { 0.0 }

            let voiceRenderer = VoiceRenderer(box: layoutItem.box, voice: voice, barlineExtraHeight: barlineHeight, alignedWidths: alignedWidths)

            previousVoiceBox = layoutItem.box
            renderables.append(voiceRenderer)
        }

        return renderables
    }
}

extension Line: Sizable {
    var reserved: (leading: CGFloat, trailing: CGFloat) { (.zero, .zero) }
    var kernableLeader: CGFloat? { voices.first?.kernableLeader }
    var childDirection: LayoutDirection { .vertical }
    var childSpacing: CGFloat { Layout.staffJoinedSeparation }
    var childSizables: [any Sizable] { voices }
    var size: Length { totalChildSize }
}

/// Re-uses sizables metrics to find common bar widths for every voice.
/// Only needed when a line contains multiple voices
struct BarAlignment: Sizable {
    let line: Line
    let availableSpace: CGFloat

    init(line: Line, availableSpace: CGFloat) throws {
        self.line = line
        self.availableSpace = availableSpace
        let barCount = line.melody.context.barCount
        guard line.voices.allSatisfy({ $0.bars.count == barCount }) else {
            // :TODO: Make this a parse error when loading document, also
            throw PdfError.inconsistentVoiceLayout
        }
    }

    var reserved: (leading: CGFloat, trailing: CGFloat) { (.zero, .zero) }
    var kernableLeader: CGFloat? { nil }
    var childDirection: LayoutDirection { .horizontal }
    var childSpacing: CGFloat { .zero }
    var childSizables: [any Sizable] {
        var maxBarPerGroup = [Bar]()
        for barIndex in line.melody.bars.indices {
            let bars = line.voices.map { $0.bars[barIndex] }
            maxBarPerGroup.append(bars.max(by: ({ $0.size.advance < $1.size.advance }))!)
        }

        var sizeables: [any Sizable] = maxBarPerGroup
        if let leadingBarline = line.melody.leadingBarline {
            sizeables.insert(leadingBarline, at: 0)
        }
        if let firstBar = line.melody.bars.first, firstBar.context.isFirstBarOfTune {
            sizeables.insert(firstBar.context.timeSignature, at: 0)
        }
        return sizeables
    }

    var size: Length { totalChildSize }
}

#endif // !os(Linux)
