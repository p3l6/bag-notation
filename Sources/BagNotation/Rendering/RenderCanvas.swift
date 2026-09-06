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

        guard let font = NSFont(name: "Bravura", size: 30) else {
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

    func drawText(_ text: String, at point: CGPoint, fontSize: CGFloat) {
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

    func advancePage() {
        // :TODO: calculate if multiple pages are needed, and when to break for them
    }
}

enum BravuraSymbol: String {
    case noteHead = "\u{E0A4}"
    // More: https://smufl.formats.music/latest/tables/staff-brackets-and-dividers.html
}

#endif // !os(Linux)
