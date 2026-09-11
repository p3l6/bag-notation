//
//  RenderCanvas.swift
//  Bag Notation
//

#if !os(Linux)

import AppKit
import CoreGraphics
import Foundation

struct RenderCanvas {
    let fonts: Fonts
    let graphics: CGContext

    init(graphics: CGContext) throws {
        self.graphics = graphics

        fonts = try Fonts()
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

    func drawLineHoriz(from: CGPoint, length: CGFloat, width: CGFloat) {
        drawLine(from: from, to: CGPoint(x: from.x + length, y: from.y), width: width)
    }

    enum Justification {
        case left
        case center
        case right
    }

    func drawText(_ text: String, at point: CGPoint, fontSize: CGFloat, kind: Fonts.AcademicoKinds = .regular, justify: Justification = .left) {
        let attributedString = NSAttributedString(string: text, attributes: [.font: fonts.academico(fontSize, kind)])
        let line = CTLineCreateWithAttributedString(attributedString)

        let lineWidth = CTLineGetTypographicBounds(line, nil, nil, nil)
        let realPoint = switch justify {
        case .left: point
        case .right: CGPoint(x: point.x - lineWidth, y: point.y)
        case .center: CGPoint(x: point.x - lineWidth / 2, y: point.y)
        }

        graphics.saveGState()
        graphics.textMatrix = .identity
        graphics.textPosition = realPoint
        CTLineDraw(line, graphics)
        graphics.restoreGState()
    }

    func drawSymbol(_ symbol: BravuraSymbol, at point: CGPoint, small: Bool = false) {
        let font = small ? fonts.bravura.small : fonts.bravura.regular
        let attributedString = NSAttributedString(string: symbol.rawValue, attributes: [.font: font])
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
}

struct Fonts {
    let bravura: (regular: NSFont, small: NSFont)
    let academico: (regular: NSFont, bold: NSFont, italic: NSFont, boldItalic: NSFont)

    enum BravuraSizes {
        case regular, small
    }

    enum AcademicoKinds {
        case regular, bold, italic, boldItalic
    }

    static let fontFiles = ["Bravura/Bravura",
                            "Academico/AcademicoRegular",
                            "Academico/AcademicoBold",
                            "Academico/AcademicoItalic",
                            "Academico/AcademicoBoldItalic"]

    init() throws {
        for fontFile in Self.fontFiles {
            guard let url = Bundle.module.url(forResource: fontFile, withExtension: "otf") else {
                throw PdfError.couldNotLoadFont
            }
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }

        guard let bravura = NSFont(name: "Bravura", size: Layout.bravuraFontSize) else {
            throw PdfError.couldNotLoadFont
        }

        self.bravura = (bravura, bravura.withSize(Layout.bravuraFontSmallSize))

        guard let regular = NSFontManager.shared.font(withFamily: "Academico",
                                                      traits: [],
                                                      weight: 5,
                                                      size: Layout.bravuraFontSmallSize),
            let bold = NSFontManager.shared.font(withFamily: "Academico",
                                                 traits: [.boldFontMask],
                                                 weight: 5,
                                                 size: Layout.bravuraFontSmallSize),
            let italic = NSFontManager.shared.font(withFamily: "Academico",
                                                   traits: [.italicFontMask],
                                                   weight: 5,
                                                   size: Layout.bravuraFontSmallSize),
            let boldItalic = NSFontManager.shared.font(withFamily: "Academico",
                                                       traits: [.boldFontMask, .italicFontMask],
                                                       weight: 5,
                                                       size: Layout.bravuraFontSmallSize)
        else {
            throw PdfError.couldNotLoadFont
        }
        academico = (regular, bold, italic, boldItalic)
    }

    func bravura(_ size: BravuraSizes) -> NSFont {
        switch size {
        case .regular: bravura.regular
        case .small: bravura.small
        }
    }

    func academico(_ size: CGFloat, _ kind: AcademicoKinds) -> NSFont {
        switch kind {
        case .regular: academico.regular.withSize(size)
        case .bold: academico.bold.withSize(size)
        case .italic: academico.italic.withSize(size)
        case .boldItalic: academico.boldItalic.withSize(size)
        }
    }
}

#endif // !os(Linux)
