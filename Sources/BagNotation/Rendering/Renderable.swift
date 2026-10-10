//
//  Renderable.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

protocol Renderable<S> {
    associatedtype S: Sizable
    init(inside box: BoundingBox, rendering: S)
    var box: BoundingBox { get }
    func render(in graphics: RenderCanvas, with anchors: AnchorSet) throws
    func directChildren() throws -> [any Renderable]
}

extension Renderable {
    /// Collects this renderable, and all descendent renderables.
    ///
    /// This is to be used at the top level of the rendering stack, and only
    /// called once. It should not be called by any renderable for making calculations
    /// or layouts.
    func collectAllRenderables() throws -> ([any Renderable], AnchorSet) {
        var parents: [any Renderable] = [self]
        var renderables = parents
        var anchors = AnchorSet()

        while !parents.isEmpty {
            let parent = parents.removeFirst()
            let children = try parent.directChildren()
            parents.append(contentsOf: children)
            renderables.append(contentsOf: children)
        }

        for renderable in renderables {
            if let anchorable = renderable as? any Anchorable {
                anchors.add(anchorable)
            }
        }

        return (renderables, anchors)
    }
}

class BaseRenderable {
    var box: BoundingBox
    var reservedLeading: CGFloat = 0
    var reservedTrailing: CGFloat = 0
    /// Override layout method to provide a final width for each sizable item
    /// - Note: count must match count of sized items!
    var predefinedLayoutSizes: [CGFloat]?

    init(inside box: BoundingBox) {
        self.box = box
    }

    enum LayoutDirection {
        case horizontal
        case vertical
    }

    func stretch(_ direction: LayoutDirection, _ inputs: [Sizable], in available: CGFloat, spacing: CGFloat? = nil) throws -> [(spaceBefore: CGFloat, size: CGFloat)] {
        var spaceBefore = inputs.map { item in
            guard let spacing else { return 0.0 }
            guard let kern = item.kernableLeader else { return spacing }
            return max(0, spacing - kern)
        }
        if !spaceBefore.isEmpty {
            spaceBefore[0] = 0
        }

        let sizes = inputs.map(direction == .horizontal ? \.width : \.height)

        // Sum of all the individual parts
        var totalSize: CGFloat = 0
        var stretchableCount = 0
        for (space, size) in zip(spaceBefore, sizes) {
            switch size {
            case .zero:
                totalSize += space
            case let .exact(value):
                totalSize += value + space
            case let .atLeast(value):
                totalSize += value + space
                stretchableCount += 1
            case .full:
                throw PdfError.insufficientSpace
            }
        }

        // make sure they fit, or error
        let extra = available - totalSize
        guard extra >= 0 else {
            // :TODO: Consider alternatives, such as rendering what can be fit.
            // perhaps configuable, this is only desired on line layouts?
            throw PdfError.insufficientSpace
        }

        // strech value per adjustable block if needed
        let stretch = stretchableCount == 0 ? 0 : extra / CGFloat(stretchableCount)

        // calculate a stretched size for each box
        return try zip(spaceBefore, inputs).map { space, item in
            switch direction == .horizontal ? item.width : item.height {
            case .zero: (space, 0.0)
            case let .exact(value): (space, value)
            case let .atLeast(value): (space, value + stretch)
            case .full:
                throw PdfError.insufficientSpace
            }
        }
    }

    private func layoutSizes(_ direction: LayoutDirection, _ inputs: [Sizable], spacing: CGFloat? = nil) throws -> [(spaceBefore: CGFloat, size: CGFloat)] {
        if let predefinedLayoutSizes {
            return predefinedLayoutSizes.map { (0, $0) }
        }
        let available = (direction == .horizontal ? box.width : box.height) - reservedLeading - reservedTrailing
        return try stretch(direction, inputs, in: available, spacing: spacing)
    }

    func layout(_ direction: LayoutDirection, _ inputs: [Sizable], spacing: CGFloat? = nil) throws -> [LayoutResult] {
        let itemCount = inputs.count
        let spaceAndSizes = try layoutSizes(direction, inputs, spacing: spacing)
        guard itemCount > 0 && itemCount == spaceAndSizes.count && spaceAndSizes.allSatisfy({ $0.size >= 0 }) else {
            throw PdfError.invalidLayoutParameters
        }

        // create Render objects with bounding boxes
        var advance = reservedLeading
        return zip(inputs, spaceAndSizes).map { item, spaceAndSizes in
            let (spaceBefore, actual) = spaceAndSizes
            advance += spaceBefore

            let layoutBox = if direction == .horizontal {
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
            return LayoutResult(sizable: item, box: layoutBox)
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
    /// The amount of space which may be ommited from the spacing between this and the previous item, if any spacing is present.
    var kernableLeader: CGFloat? { get }
    // :TODO: Should cache these somehow
    // :TODO: one of these should always be .full. Enforce that?
    var height: Length { get }
    var width: Length { get }
}

protocol Anchored {
    associatedtype Anchors
    var id: String { get }
}

protocol Anchorable {
    associatedtype Anchor: Anchored
    var anchor: Anchor { get }
    func anchors() -> Anchor.Anchors
}

struct AnchorSet {
    private var anchors = [String: Any]()
    mutating func add(_ anchorable: any Anchorable) {
        anchors[anchorable.anchor.id] = anchorable.anchors()
    }

    func anchors<A: Anchored>(for anchored: A) throws -> A.Anchors {
        guard let stored = anchors[anchored.id] as? A.Anchors else { throw PdfError.missingAnchor }
        return stored
    }
}

struct LayoutResult {
    let sizable: any Sizable
    let box: BoundingBox
}

#endif // !os(Linux)
