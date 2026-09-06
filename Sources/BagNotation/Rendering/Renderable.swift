//
//  Renderable.swift
//  Bag Notation
//

import CoreGraphics

protocol Renderable<S> {
    associatedtype S: Sizable
    init(inside boundingBox: BoundingBox, rendering: S)
    func render(in graphics: RenderCanvas)
    func directChildren() throws -> [any Renderable]
}

class BaseRenderable {
    var boundingBox: BoundingBox
    init(inside boundingBox: BoundingBox) {
        self.boundingBox = boundingBox
    }

    func layoutVertically(_ inputs: [Sizable], insideMargin: CGFloat? = nil) throws -> [BoundingBox] {
        let heights = inputs.map(\.heightRequirement)

        // total height
        var totalHeight: CGFloat = 0
        var stretchableCount = 0
        for height in heights {
            switch height {
            case let .exact(value):
                totalHeight += value
            case let .atLeast(value):
                totalHeight += value
                stretchableCount += 1
            case .full:
                throw PdfError.insufficientSpace
            }
        }

        // make sure they fit, or error
        let extraHeight = boundingBox.height - totalHeight
        guard extraHeight >= 0 else {
            throw PdfError.insufficientSpace
        }

        // strech if needed
        let stretch = extraHeight / CGFloat(stretchableCount)

        // create Render objects with bounding boxes
        var advance = 0.0
        return try inputs.map { line in
            let actualHeight = switch line.heightRequirement {
            case let .exact(value): value
            case let .atLeast(value): value + stretch
            case .full: throw PdfError.insufficientSpace
            }
            let actualSize = BoundingBox(left: boundingBox.left,
                                         bottom: boundingBox.bottom + boundingBox.height - advance - actualHeight,
                                         width: boundingBox.width,
                                         height: actualHeight)
            advance += actualHeight
            advance += insideMargin ?? 0
            return actualSize
        }
    }

    func layoutHorizontally(_ inputs: [Sizable], insideMargin: CGFloat? = nil) throws -> [BoundingBox] {
        let widths = inputs.map(\.width)

        // total height
        var totalWidth: CGFloat = 0
        var stretchableCount = 0
        for width in widths {
            switch width {
            case let .exact(value):
                totalWidth += value
            case let .atLeast(value):
                totalWidth += value
                stretchableCount += 1
            case .full:
                throw PdfError.insufficientSpace
            }
        }

        // make sure they fit, or error
        let extraWidth = boundingBox.width - totalWidth
        guard extraWidth >= 0 else {
            throw PdfError.insufficientSpace
        }

        // strech if needed
        let stretch = extraWidth / CGFloat(stretchableCount)

        // create Render objects with bounding boxes
        var advance = 0.0
        return try inputs.map { line in
            let actualWidth = switch line.width {
            case let .exact(value): value
            case let .atLeast(value): value + stretch
            case .full: throw PdfError.insufficientSpace
            }
            //// :TODO:  warn if hightReq != .full ?
            let actualSize = BoundingBox(left: boundingBox.left + advance,
                                         bottom: boundingBox.bottom,
                                         width: actualWidth,
                                         height: boundingBox.height)
            advance += actualWidth
            advance += insideMargin ?? 0
            return actualSize
        }
    }
}

struct BoundingBox {
    let left: CGFloat
    let bottom: CGFloat
    let width: CGFloat
    let height: CGFloat
}

enum StretchyWidth {
    case exact(CGFloat)
    case atLeast(CGFloat)
    case full
}

protocol Sizable {
    /// false for trailing-in-container stuff like barlines
    var alignLeading: Bool { get }

    // TODO: Should cache these somehow
    // :TODO: one of these should always be .full. Enforce that?
    // exact height required
    var heightRequirement: StretchyWidth { get }
    /// min width required
    var width: StretchyWidth { get }
}
