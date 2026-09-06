//
//  RenderCanvas.swift
//  Bag Notation
//

import AppKit // // :TODO: can we not? just for colors...
import CoreGraphics
import CoreText
import Foundation

/// or RenderCanvas or renderDestination
struct RenderCanvas {
    let pageSize: CGSize
    let margin: CGFloat = 48
    let staffLeft: CGFloat = 48
    var staffRight: CGFloat { pageSize.width - margin }
    var firstStaffTop: CGFloat { pageSize.height - margin - 128 }

    let graphics: CGContext

    func drawLine(from start: CGPoint, to end: CGPoint, width: CGFloat) {
        graphics.saveGState()
        graphics.setStrokeColor(NSColor.black.cgColor)
        graphics.setLineWidth(width)
        graphics.move(to: start)
        graphics.addLine(to: end)
        graphics.strokePath()
        graphics.restoreGState()
    }

    func drawText(_ text: String, at point: CGPoint, font: NSFont) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: NSColor.black
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        let line = CTLineCreateWithAttributedString(attributedString)

        graphics.saveGState()
        graphics.textMatrix = .identity
        graphics.textPosition = point
        CTLineDraw(line, graphics)
        graphics.restoreGState()
    }

    func drawSymbol(_ codePoint: String, at point: CGPoint) {
        // // :TODO: throw
        guard let font = bravuraFont(size: 30) else { return }
        // :TODO: make an enum for these codepoints
        drawText(codePoint, at: point, font: font)
    }

    private func bravuraFont(size: CGFloat) -> NSFont? {
        registerBravuraFontIfNeeded()
        return NSFont(name: "Bravura", size: size)
    }

    private func registerBravuraFontIfNeeded() {
        guard let url = Bundle.module.url(forResource: "Bravura/Bravura", withExtension: "otf") else {
            // :TODO: throw
            return
        }
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
    }

    func advancePage() {}
}
