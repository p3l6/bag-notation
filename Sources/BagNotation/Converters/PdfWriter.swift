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

        let canvas = try RenderCanvas(pageSize: pageSize, graphics: context)
        let canvasBounding = BoundingBox(left: Layout.pageMargin,
                                         bottom: Layout.pageMargin,
                                         width: pageSize.width - Layout.pageMargin * 2,
                                         height: pageSize.height - Layout.pageMargin * 2)

        var parents: [any Renderable] = [TuneRenderer(inside: canvasBounding, rendering: doc.tunes.first!)]
        var renderables = parents

        while !parents.isEmpty {
            let parent = parents.removeFirst()
            let children = try parent.directChildren()
            parents.append(contentsOf: children)
            renderables.append(contentsOf: children)
        }

        context.beginPDFPage(nil)

        renderables.forEach { $0.render(in: canvas) }

        context.endPDFPage()
        context.closePDF()

        return data as Data
    }
}

public enum PdfError: Error {
    case couldNotCreateContext
    case insufficientSpace
    case couldNotLoadFont
}

#endif // !os(Linux)
