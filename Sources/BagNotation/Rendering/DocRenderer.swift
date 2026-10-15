//
//  DocRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

struct DocRenderer: Renderable {
    let doc: Doc
    let box: BoundingBox
    let pageSize: CGSize
    let pageSafeArea: CGSize

    /// Unlike all other renderables, Doc expects the full pageSize as the bounding box.
    init(inside box: BoundingBox, rendering doc: Doc) {
        self.doc = doc
        self.box = box
        pageSize = CGSize(width: box.width, height: box.height)
        pageSafeArea = CGSize(width: box.width - Layout.pageMargin * 2,
                              height: box.height - Layout.pageMargin * 2)
    }

    func render(in _: RenderCanvas, with _: AnchorSet) {}

    func directChildren() throws -> [any Renderable] {
        let tunes = doc.tunes
        let pageContentHeight = pageSafeArea.height - Layout.pageFooterHeight
        var currentPage = 0
        var pageAdvance: CGFloat = 0

        var renderables = [any Renderable]()
        renderables.append(PageFooter(page: currentPage, pageSize: pageSize, doc: doc))

        for tune in tunes {
            let tuneHeight = tune.size.advance
            var pageAvailable = pageContentHeight - pageAdvance

            if tune.header.forceNewPage {
                currentPage += 1
                pageAdvance = 0
                pageAvailable = pageContentHeight
                renderables.append(PageFooter(page: currentPage, pageSize: pageSize, doc: doc))
            } else if tuneHeight <= pageContentHeight && tuneHeight > pageAvailable {
                currentPage += 1
                pageAdvance = 0
                pageAvailable = pageContentHeight
                renderables.append(PageFooter(page: currentPage, pageSize: pageSize, doc: doc))
            }

            let wrappedSize = try tune.wrappedSize(available: pageAvailable, overflowHeight: pageContentHeight)
            var tuneBoxes = [BoundingBox]()
            if !wrappedSize.discardAvailable {
                tuneBoxes.append(BoundingBox(page: currentPage,
                                             left: Layout.pageMargin,
                                             bottom: Layout.pageMargin + Layout.pageFooterHeight,
                                             width: pageSafeArea.width,
                                             height: pageAvailable))
            }

            if wrappedSize.overflows > 0 {
                for pageOffset in 1 ... wrappedSize.overflows {
                    let page = currentPage + pageOffset
                    tuneBoxes.append(BoundingBox(page: page,
                                                 left: Layout.pageMargin,
                                                 bottom: Layout.pageMargin + Layout.pageFooterHeight,
                                                 width: pageSafeArea.width,
                                                 height: pageContentHeight))
                    renderables.append(PageFooter(page: page, pageSize: pageSize, doc: doc))
                }
            }

            renderables.append(TuneRenderer(boxes: tuneBoxes, tune: tune))

            currentPage += wrappedSize.overflows
            pageAdvance = wrappedSize.overflows == 0
                ? pageAdvance + wrappedSize.lastPageAdvance
                : wrappedSize.lastPageAdvance
            pageAdvance += Layout.tuneSeparation
        }

        return renderables
    }
}

struct PageFooter: Renderable {
    var box: BoundingBox
    var doc: Doc

    init(page: Int, pageSize: CGSize, doc: Doc) {
        let box = BoundingBox(page: page,
                              left: Layout.pageMargin,
                              bottom: Layout.pageMargin,
                              width: pageSize.width - Layout.pageMargin * 2,
                              height: Layout.pageFooterHeight)

        self.box = box
        self.doc = doc
    }

    func render(in graphics: RenderCanvas, with _: AnchorSet) {
        graphics.drawText("[p \(box.page + 1)]", at: box.bottomRight, fontSize: Layout.footerFontSize, justify: .right)
        guard let rev = doc.revision else { return }
        graphics.drawText("(rev: \(rev))", at: box.origin, fontSize: Layout.footerFontSize)
    }

    func directChildren() throws -> [any Renderable] { [] }
}

extension Doc: Sizable {
    var reserved: (leading: CGFloat, trailing: CGFloat) { (.zero, .zero) }
    var kernableLeader: CGFloat? { nil }
    var childDirection: LayoutDirection { .vertical }
    var childSpacing: CGFloat { Layout.tuneSeparation }
    var childSizables: [any Sizable] { [] }
    var size: Length { .full }
}

#endif // !os(Linux)
