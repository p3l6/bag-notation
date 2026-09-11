//
//  Renderable.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

protocol Renderable<S> {
    associatedtype S: Sizable
    init(inside boundingBox: BoundingBox, rendering: S)
    var box: BoundingBox { get }
    func render(in graphics: RenderCanvas)
    func directChildren() throws -> [any Renderable]
}

extension Renderable {
    /// Collects this renderable, and all descendent renderables.
    ///
    /// This is to be used at the top level of the rendering stack, and only
    /// called once. It should not be called by any renderable for making calculations
    /// or layouts.
    func collectAllRenderables() throws -> [any Renderable] {
        var parents: [any Renderable] = [self]
        var renderables = parents

        while !parents.isEmpty {
            let parent = parents.removeFirst()
            let children = try parent.directChildren()
            parents.append(contentsOf: children)
            renderables.append(contentsOf: children)
        }

        return renderables
    }
}

class BaseRenderable {
    var box: BoundingBox
    var reservedLeading: CGFloat = 0
    var reservedTrailing: CGFloat = 0

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
            case .zero: continue
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
        let available = (direction == .horizontal ? box.width : box.height) - reservedLeading - reservedTrailing
        let extra = available - totalSize
        guard extra >= 0 else {
            throw PdfError.insufficientSpace
        }

        // strech value per adjustable block if needed
        // :TODO: consider scaling this assignment relative to the porportional width of each stretchy item
        let stretch = stretchableCount == 0 ? 0 : extra / CGFloat(stretchableCount)

        // create Render objects with bounding boxes
        var advance = reservedLeading
        return try inputs.map { item in
            let requirement = direction == .horizontal ? item.width : item.height
            let actual = switch requirement {
            case .zero: 0.0
            case let .exact(value): value
            case let .atLeast(value): value + stretch
            case .full:
                throw PdfError.insufficientSpace
            }
            let actualSize = if direction == .horizontal {
                BoundingBox(page: box.page,
                            left: box.left + advance,
                            bottom: box.bottom,
                            width: actual,
                            height: box.height)
            } else {
                BoundingBox(page: box.page,
                            left: box.left,
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
    let page: Int
    let left: CGFloat
    let bottom: CGFloat
    let width: CGFloat
    let height: CGFloat

    func inset(x: CGFloat = 0, y: CGFloat = 0) -> CGPoint {
        CGPoint(x: left + x, y: bottom + y)
    }

    func insetFromTop(x: CGFloat = 0, y: CGFloat = 0) -> CGPoint {
        CGPoint(x: left + x, y: top - y)
    }

    func insetFromRight(x: CGFloat = 0, y: CGFloat = 0) -> CGPoint {
        CGPoint(x: right - x, y: bottom + y)
    }

    func insetFromTopRight(x: CGFloat = 0, y: CGFloat = 0) -> CGPoint {
        CGPoint(x: right - x, y: top - y)
    }

    var right: CGFloat { left + width }
    var top: CGFloat { bottom + height }

    var origin: CGPoint { .init(x: left, y: bottom) }
    var topLeft: CGPoint { .init(x: left, y: top) }
    var topRight: CGPoint { .init(x: right, y: top) }
    var bottomRight: CGPoint { .init(x: right, y: bottom) }
}

enum Length {
    case zero
    case exact(CGFloat)
    case atLeast(CGFloat)
    case full

    static func + (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.zero, _): rhs
        case (_, .zero): lhs
        case (.full, _), (_, .full): .full
        case let (.exact(lv), .exact(rv)): .exact(lv + rv)
        case let (.atLeast(lv), .exact(rv)),
             let (.atLeast(lv), .atLeast(rv)),
             let (.exact(lv), .atLeast(rv)): .atLeast(lv + rv)
        }
    }

    static func += (lhs: inout Length, rhs: Length) {
        lhs = lhs + rhs
    }

    static func += (lhs: inout Length, rhs: [Length]) {
        lhs += rhs.sum
    }

    var advance: CGFloat {
        switch self {
        case .zero: 0.0
        case let .exact(v), let .atLeast(v): v
        case .full: .infinity
        }
    }
}

extension [Length] {
    var sum: Length {
        reduce(.exact(0), +)
    }
}

protocol Sizable {
    // :TODO: Should cache these somehow
    // :TODO: one of these should always be .full. Enforce that?
    var height: Length { get }
    var width: Length { get }
}

#endif // !os(Linux)
