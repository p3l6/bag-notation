//
//  Renderable.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

protocol Renderable<S> {
    associatedtype S: Sizable
    init(inside boundingBox: BoundingBox, rendering: S)
    func render(in graphics: RenderCanvas)
    func directChildren() throws -> [any Renderable]
}

class BaseRenderable {
    var box: BoundingBox
    init(inside box: BoundingBox) {
        self.box = box
    }

    enum LayoutDirection {
        case horizontal
        case vertical
    }

    func layout(_ direction: LayoutDirection, _ inputs: [Sizable], spacing: CGFloat? = nil) throws -> [BoundingBox] {
        let sizes = inputs.map(direction == .horizontal ? \.width : \.height)

        // Sum of all the individual parts
        var totalSize: CGFloat = 0
        var stretchableCount = 0
        for size in sizes {
            switch size {
            case let .exact(value):
                totalSize += value
            case let .atLeast(value):
                totalSize += value
                stretchableCount += 1
            case .full:
                throw PdfError.insufficientSpace
            }
        }

        // make sure they fit, or error
        let extra = (direction == .horizontal ? box.width : box.height) - totalSize
        guard extra >= 0 else {
            throw PdfError.insufficientSpace
        }

        // strech value per adjustable block if needed
        let stretch = stretchableCount == 0 ? 0 : extra / CGFloat(stretchableCount)

        // create Render objects with bounding boxes
        var advance = 0.0
        return try inputs.map { item in
            let requirement = direction == .horizontal ? item.width : item.height
            let actual = switch requirement {
            case let .exact(value): value
            case let .atLeast(value): value + stretch
            case .full: throw PdfError.insufficientSpace
            }
            let actualSize = if direction == .horizontal {
                BoundingBox(left: box.left + advance,
                            bottom: box.bottom,
                            width: actual,
                            height: box.height)
            } else {
                BoundingBox(left: box.left,
                            bottom: box.bottom + box.height - advance - actual,
                            width: box.width,
                            height: actual)
            }
            advance += actual
            advance += spacing ?? 0
            return actualSize
        }
    }
}

struct BoundingBox {
    let left: CGFloat
    let bottom: CGFloat
    let width: CGFloat
    let height: CGFloat

    func inset(x: CGFloat, y: CGFloat) -> CGPoint {
        CGPoint(x: left + x, y: bottom + y)
    }

    func insetFromTop(x: CGFloat, y: CGFloat) -> CGPoint {
        CGPoint(x: left + x, y: bottom + height - y)
    }
}

enum Length {
    case exact(CGFloat)
    case atLeast(CGFloat)
    case full
}

protocol Sizable {
    var alignLeading: Bool { get }
    // :TODO: Should cache these somehow
    // :TODO: one of these should always be .full. Enforce that?
    var height: Length { get }
    var width: Length { get }
}

#endif // !os(Linux)
