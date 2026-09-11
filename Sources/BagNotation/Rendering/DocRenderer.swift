//
//  DocRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class DocRenderer: BaseRenderable, Renderable<Doc> {
    let doc: Doc
    let pageSize: CGSize
    let pageSafeArea: CGSize

    /// Unlike all other renderables, Doc expects the full pageSize as the bounding box.
    init(inside box: BoundingBox, rendering doc: Doc) {
        self.doc = doc
        pageSize = CGSize(width: box.width, height: box.height)
        pageSafeArea = CGSize(width: box.width - Layout.pageMargin * 2, height: box.height - Layout.pageMargin * 2)
        super.init(inside: box)
    }

    func render(in _: RenderCanvas) {}

    func directChildren() throws -> [any Renderable] {
        let tunes = doc.tunes
        // :TODO: custom page layouts
        var pageAdvance: CGFloat = 0
        var currentPage = 0

        var renderables = [TuneRenderer]()
        for tune in tunes {
            let tuneHeight = tune.height.advance
            let pageAvailable = pageSafeArea.height - pageAdvance

            if tuneHeight > pageAvailable {
                currentPage += 1
                pageAdvance = 0

                // :TODO: handle case where a single tune exceeds page space
            }

            let tuneBounding = BoundingBox(page: currentPage,
                                           left: Layout.pageMargin,
                                           bottom: pageSafeArea.height - pageAdvance - tuneHeight,
                                           width: pageSafeArea.width,
                                           height: tuneHeight)

            renderables.append(TuneRenderer(inside: tuneBounding, rendering: tune))

            pageAdvance += tuneHeight
            pageAdvance += Layout.tuneSeparation
        }

        return renderables
    }
}

extension Doc: Sizable {
    var width: Length { .full }
    var height: Length { .full }
}

#endif // !os(Linux)
