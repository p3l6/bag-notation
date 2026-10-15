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
        pageSafeArea = CGSize(width: box.width - Layout.pageMargin * 2, height: box.height - Layout.pageMargin * 2)
    }

    func render(in _: RenderCanvas, with _: AnchorSet) {}

    func directChildren() throws -> [any Renderable] {
        let tunes = doc.tunes
        var pageAdvance: CGFloat = 0
        var currentPage = 0

        var renderables = [any Renderable]()
        renderables.append(PageFooter(page: currentPage, pageSize: pageSize, doc: doc))

        for tune in tunes {
            let tuneHeight = tune.size.advance
            let pageAvailable = pageSafeArea.height - Layout.pageFooterHeight - pageAdvance

            if tuneHeight > pageAvailable || tune.header.forceNewPage {
                currentPage += 1
                pageAdvance = 0

                renderables.append(PageFooter(page: currentPage, pageSize: pageSize, doc: doc))
                // :TODO: handle case where a single tune exceeds page space
            }

            let tuneBounding = BoundingBox(page: currentPage,
                                           left: Layout.pageMargin,
                                           bottom: Layout.pageMargin + pageSafeArea.height - pageAdvance - tuneHeight,
                                           width: pageSafeArea.width,
                                           height: tuneHeight)

            renderables.append(TuneRenderer(box: tuneBounding, tune: tune))

            pageAdvance += tuneHeight
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
        guard let rev = doc.revision else { return }
        graphics.drawText("(rev: \(rev))", at: box.origin, fontSize: Layout.footerFontSize)
        graphics.drawText("[p \(box.page + 1)]", at: box.bottomRight, fontSize: Layout.footerFontSize, justify: .right)
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
