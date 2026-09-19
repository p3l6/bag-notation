//
//  PdfWriter.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics
import Foundation

public class PdfWriter {
    let doc: Doc
    public var landscape = false

    public init(_ doc: Doc) { self.doc = doc }

    public func makePdf() throws -> Data {
        let pageSize = landscape ? CGSize(width: 792, height: 612) : CGSize(width: 612, height: 792)
        var mediaBox = CGRect(origin: .zero, size: pageSize)
        let data = NSMutableData()

        guard let consumer = CGDataConsumer(data: data as CFMutableData),
              let context = CGContext(consumer: consumer, mediaBox: &mediaBox, nil) else {
            throw PdfError.couldNotCreateContext
        }

        let canvas = try RenderCanvas(graphics: context)
        let pageBounding = BoundingBox(page: 0, left: 0, bottom: 0, width: pageSize.width, height: pageSize.height)

        let doc = DocRenderer(inside: pageBounding, rendering: doc)

        let renderables = try doc.collectAllRenderables()

        let pages = Dictionary(grouping: renderables, by: { $0.box.page })

        for page in pages.keys.sorted() {
            let pageRenderables = pages[page]!

            context.beginPDFPage(nil)
            pageRenderables.forEach { $0.render(in: canvas) }
            context.endPDFPage()
        }

        context.closePDF()

        return data as Data
    }
}

public enum PdfError: Error {
    case couldNotCreateContext
    case insufficientSpace
    case couldNotLoadFont
    case unexpectedSizable
    case unexpectedVariationAnchor
    case invalidLayoutParameters
    case inconsistentVoiceLayout
}

#endif // !os(Linux)
