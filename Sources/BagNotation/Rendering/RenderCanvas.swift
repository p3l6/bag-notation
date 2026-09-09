//
//  RenderCanvas.swift
//  Bag Notation
//

#if !os(Linux)

import AppKit
import CoreGraphics
import Foundation

struct RenderCanvas {
    let pageSize: CGSize
    let bravuraFont: NSFont
    let graphics: CGContext

    init(pageSize: CGSize, graphics: CGContext) throws {
        self.pageSize = pageSize
        self.graphics = graphics

        guard let url = Bundle.module.url(forResource: "Bravura/Bravura", withExtension: "otf") else {
            throw PdfError.couldNotLoadFont
        }
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)

        guard let font = NSFont(name: "Bravura", size: Layout.bravuraFontSize) else {
            throw PdfError.couldNotLoadFont
        }
        bravuraFont = font
    }

    func drawLine(from start: CGPoint, to end: CGPoint, width: CGFloat) {
        graphics.saveGState()
        graphics.setStrokeColor(CGColor.black)
        graphics.setLineWidth(width)
        graphics.move(to: start)
        graphics.addLine(to: end)
        graphics.strokePath()
        graphics.restoreGState()
    }

    func drawLineVert(from: CGPoint, length: CGFloat, width: CGFloat) {
        drawLine(from: from, to: CGPoint(x: from.x, y: from.y + length), width: width)
    }

    func drawLineHoiz(from: CGPoint, length: CGFloat, width: CGFloat) {
        drawLine(from: from, to: CGPoint(x: from.x + length, y: from.y), width: width)
    }

    func drawText(_ text: String, at point: CGPoint, fontSize: CGFloat) {
        // :TODO: What font should this use? is it embedded in pdf already?
        let attributedString = NSAttributedString(string: text, attributes: [.font: NSFont.systemFont(ofSize: fontSize)])
        let line = CTLineCreateWithAttributedString(attributedString)

        graphics.saveGState()
        graphics.textMatrix = .identity
        graphics.textPosition = point
        CTLineDraw(line, graphics)
        graphics.restoreGState()
    }

    func drawSymbol(_ symbol: BravuraSymbol, at point: CGPoint) {
        let attributedString = NSAttributedString(string: symbol.rawValue, attributes: [.font: bravuraFont])
        let line = CTLineCreateWithAttributedString(attributedString)

        graphics.saveGState()
        graphics.textMatrix = .identity
        graphics.textPosition = point
        CTLineDraw(line, graphics)
        graphics.restoreGState()
    }

    func debugOutline(box: BoundingBox) {
        graphics.saveGState()
        graphics.setStrokeColor(CGColor(red: 1, green: 0, blue: 0, alpha: 1))
        graphics.setLineWidth(0.5)
        graphics.move(to: box.origin)
        graphics.addLine(to: box.topLeft)
        graphics.addLine(to: box.topRight)
        graphics.addLine(to: box.bottomRight)
        graphics.addLine(to: box.origin)
        graphics.strokePath()
        graphics.restoreGState()
    }

    func advancePage() {
        // :TODO: calculate if multiple pages are needed, and when to break for them
    }
}

#endif // !os(Linux)
