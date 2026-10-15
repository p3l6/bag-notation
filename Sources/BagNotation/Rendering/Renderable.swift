//
//  Renderable.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

protocol Renderable {
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

extension Renderable {
    /// - Parameter overrideSizes: Overrides stretch method to provide a final width for each sizable item
    /// - Note: count must match count of sized items!
    func layout(_ input: Sizable, overrideSizes: [CGFloat]? = nil) throws -> [LayoutResult] {
        let inputs = input.childSizables

        let itemCount = inputs.count
        var spaceAndSizes: [(spaceBefore: CGFloat, size: CGFloat)]!
        if let overrideSizes {
            guard itemCount == overrideSizes.count else {
                throw PdfError.invalidLayoutParameters
            }
            spaceAndSizes = overrideSizes.map { (0, $0) }
        } else {
            let available = (input.childDirection == .horizontal ? box.width : box.height) - input.reserved.leading - input.reserved.trailing
            spaceAndSizes = try input.stretchChildren(in: available)
        }

        guard itemCount > 0 && itemCount == spaceAndSizes.count && spaceAndSizes.allSatisfy({ $0.size >= 0 }) else {
            throw PdfError.invalidLayoutParameters
        }

        // create bounding boxes for inputs
        var advance = input.reserved.leading
        return zip(inputs, spaceAndSizes).map { item, spaceAndSizes in
            let (spaceBefore, actual) = spaceAndSizes
            advance += spaceBefore

            let layoutBox = if input.childDirection == .horizontal {
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
        reduce(.zero, +)
    }
}

enum LayoutDirection {
    case horizontal
    case vertical
}

protocol Sizable {
    /// Amounts of space that should be excluded from child layout
    var reserved: (leading: CGFloat, trailing: CGFloat) { get }
    /// The amount of space which may be ommited from the spacing between this and the previous item, if any spacing is present.
    var kernableLeader: CGFloat? { get }
    /// The size of this item, including all child item requirements
    var size: Length { get }

    /// Sizables that need to be accounted for when determining this elements total size
    var childSizables: [Sizable] { get }
    /// The direction in which child elements will be arranged
    var childDirection: LayoutDirection { get }
    /// Spacing for child elements
    var childSpacing: CGFloat { get }
}

extension Sizable {
    fileprivate func kern(into spacing: CGFloat) -> CGFloat {
        guard let kern = kernableLeader else { return spacing }
        return max(0, spacing - kern)
    }

    var totalChildSize: Length {
        childSizables.enumerated().map { index, child in
            child.size + (index == 0 ? .zero : .exact(child.kern(into: childSpacing)))
        }.sum
    }

    func stretchChildren(in available: CGFloat) throws -> [(spaceBefore: CGFloat, size: CGFloat)] {
        let stretchableCount = childSizables.count { if case .atLeast = $0.size { true } else { false } }

        // make sure they fit, or error
        let extra = available - totalChildSize.advance
        guard extra >= 0 else {
            // :TODO: Consider alternatives, such as rendering what can be fit.
            // perhaps configuable, this is only desired on line layouts?
            throw PdfError.insufficientSpace
        }

        // strech value per adjustable block if needed
        let stretch = stretchableCount == 0 ? 0 : extra / CGFloat(stretchableCount)

        // distribute stretched amount equally into each box
        return try childSizables.enumerated().map { index, item in
            let space = index == 0 ? 0 : item.kern(into: childSpacing)
            return switch item.size {
            case .zero: (space, 0.0)
            case let .exact(value): (space, value)
            case let .atLeast(value): (space, value + stretch)
            case .full:
                throw PdfError.insufficientSpace
            }
        }
    }
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
