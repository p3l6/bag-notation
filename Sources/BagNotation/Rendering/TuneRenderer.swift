//
//  TuneRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

struct TuneRenderer: Renderable {
    var box: BoundingBox { boxes[0] }
    let boxes: [BoundingBox]
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
        try layout(tune, in: boxes).map { layoutItem in
            guard let line = layoutItem.sizable as? Line else {
                throw PdfError.unexpectedSizable
            }
            return LineRenderer(box: layoutItem.box, line: line)
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

    /// Measures line-aware pagination without splitting a staff line.
    /// Typically will be used instead of `size`
    ///
    /// - Returns:
    ///   - discardAvailable: Whether the available space can be used before moving to overflows
    ///   - overflows: Number of overflow pages needed
    ///   - lastPageAdvance: Amount of space needed on the final page (either the initial available, or an overflow)
    func wrappedSize(available: CGFloat, overflowHeight: CGFloat) throws -> (discardAvailable: Bool, overflows: Int, lastPageAdvance: CGFloat) {
        guard overflowHeight >= Layout.tuneHeaderHeight else { throw PdfError.insufficientSpace }

        let openingHeight = Layout.tuneHeaderHeight + (lines.first?.size.advance ?? 0)
        let discardAvailable = available < openingHeight
        var overflows = discardAvailable ? 1 : 0
        var available = discardAvailable ? overflowHeight : available
        var advance = Layout.tuneHeaderHeight

        for (index, line) in lines.enumerated() {
            let lineHeight = line.size.advance
            guard lineHeight <= overflowHeight else { throw PdfError.insufficientSpace }

            let spacing = index == 0 ? 0 : line.kern(into: Layout.staffSeparation)
            if advance + spacing + lineHeight > available {
                overflows += 1
                available = overflowHeight
                advance = lineHeight
            } else {
                advance += spacing + lineHeight
            }
        }

        return (discardAvailable, overflows, advance)
    }
}

#endif // !os(Linux)
