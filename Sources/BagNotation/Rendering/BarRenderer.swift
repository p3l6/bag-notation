//
//  BarRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class BarRenderer: BaseRenderable, Renderable<Bar> {
    let bar: Bar

    init(inside box: BoundingBox, rendering bar: Bar) {
        self.bar = bar
        super.init(inside: box)
    }

    func render(in _: RenderCanvas) {}

    func directChildren() throws -> [any Renderable] {
        var items = [any Sizable]()
        for item in bar.contents {
            switch item {
            case let .cluster(c):
                items.append(contentsOf: c.notes)
            default:
                continue
            }
        }
        items.append(bar.trailingBarline)

        let boxes = try layout(.horizontal, items)
        var renderables = [any Renderable]()
        for item in bar.contents {
            switch item {
            case let .cluster(c):
                for note in c.notes {
                    renderables.append(NoteRenderer(inside: boxes[renderables.count], rendering: note))
                }
            default:
                continue
            }
        }
        renderables.append(BarlineRenderer(inside: boxes.last!, rendering: bar.trailingBarline))
        return renderables
    }
}

extension Bar: Sizable {
    var width: Length {
        var width: Length = .exact(0)
        for item in contents {
            switch item {
            case let .cluster(cluster):
                width += cluster.notes.map(\.width)
//            case .rest(let duration):
//                fallthrough
//            case .barRest:
//                fallthrough
//            case .spacer(let duration):
//                fallthrough
//            case .barSpacer:
//                fallthrough
            default: break
            }
        }
        return width
    }

    var height: Length { .full }
}

// MARK: Barline

final class BarlineRenderer: BaseRenderable, Renderable<Barline> {
    let barline: Barline

    init(inside box: BoundingBox, rendering barline: Barline) {
        self.barline = barline
        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas) {
        // :TODO: switch case different barline types. Also in sizeable
        graphics.drawLine(from: box.bottomRight, to: box.inset(x: box.width, y: 4 * Layout.staffLineSpacing), width: Layout.barlineWidth)
    }

    func directChildren() throws -> [any Renderable] { [] }
}

extension Barline: Sizable {
    var width: Length { .exact(Layout.barlineWidth) }
    var height: Length { .full }
}
#endif // !os(Linux)
