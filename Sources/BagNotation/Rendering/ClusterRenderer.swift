//
//  ClusterRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

struct ClusterRenderer: Renderable {
    let box: BoundingBox
    let cluster: Cluster

    func render(in graphics: RenderCanvas, with anchors: AnchorSet) throws {
        for notes in cluster.beamGroups {
            let beam = try Beam(notes: notes, anchors: anchors)
            beam.segments.forEach { $0.draw(in: graphics) }
            beam.stemExtensions.forEach { $0.draw(in: graphics) }
        }

        // Tempo change
        if let tempo = cluster.context.tempo, cluster.context.tempoChanged {
            graphics.drawText("\(tempo) bpm",
                              at: box.insetFromTop(x: 0,
                                                   y: -Layout.annotationFontSize / 2),
                              fontSize: Layout.annotationFontSize)
        }
    }

    func directChildren() throws -> [any Renderable] {
        let noteFlags = cluster.noteFlags
        return try layout(cluster).enumerated().map { index, layoutItem in
            switch layoutItem.sizable {
            case let note as Note:
                NoteRenderer(box: layoutItem.box, note: note, flag: noteFlags[index])
            default: throw PdfError.unexpectedSizable
            }
        }
    }
}

extension Cluster: Sizable {
    var reserved: (leading: CGFloat, trailing: CGFloat) { (.zero, .zero) }
    var kernableLeader: CGFloat? { nil }
    var childDirection: LayoutDirection { .horizontal }
    var childSpacing: CGFloat { .zero }
    var childSizables: [any Sizable] { notes }
    var size: Length { totalChildSize }
}

extension Cluster: Anchored {
    var id: String { context.identifier }
    typealias Anchors = ClusterAnchors
    struct ClusterAnchors {
        let start: CGFloat
        let end: CGFloat
    }
}

extension ClusterRenderer: Anchorable {
    typealias Anchor = Cluster
    var anchor: Cluster { cluster }
    func anchors() -> Cluster.ClusterAnchors {
        .init(start: box.left, end: box.right)
    }
}

extension Cluster {
    var beamGroups: [[Note]] {
        notes
            .split { Flag.fromDuration($0.duration) == .none }
            .filter { $0.count > 1 }
            .map(Array.init)
    }

    var noteFlags: [Flag] {
        var heights = notes.map { Flag.fromDuration($0.duration) }

        guard heights.count != 1 else { return [.none] }

        for index in 0 ..< heights.count {
            let disconnectedLeft = index == 0 ? true : heights[index - 1] == .none
            let disconnectedRight = index == heights.count - 1 ? true : heights[index + 1] == .none
            if !disconnectedLeft || !disconnectedRight {
                heights[index] = heights[index].asBeam
            }
        }
        return heights
    }
}

private struct Beam {
    struct Slope {
        let m: CGFloat
        let c: CGFloat

        func height(at x: CGFloat) -> CGFloat {
            m * x + c
        }
    }

    struct Segment {
        let startX: CGFloat
        let endX: CGFloat
        let slope: Slope
        let stackIndex: Int

        func draw(in graphics: RenderCanvas) {
            let offsetY = CGFloat(stackIndex) * (Layout.noteBeamLineWidth + Layout.noteBeamSeparation)

            // :TODO: draw a paralellagram instead, to have the ends vertical
            graphics.drawLine(from: CGPoint(x: startX, y: slope.height(at: startX) + offsetY),
                              to: CGPoint(x: endX, y: slope.height(at: endX) + offsetY),
                              width: Layout.noteBeamLineWidth)
        }
    }

    struct StemExtension {
        let start: CGPoint
        let height: CGFloat

        func draw(in graphics: RenderCanvas) {
            graphics.drawLineVert(from: start,
                                  length: height,
                                  width: Layout.noteStemLineWidth)
        }
    }

    let segments: [Segment]
    let stemExtensions: [StemExtension]
    let slope: Slope

    // :TODO: Beams can overlap with embellishments, ie `hvh.e/`

    init(notes: [Note], anchors anchorSet: AnchorSet) throws {
        let anchors = try notes.map { try anchorSet.anchors(for: $0) }
        if anchors.count > 1 {
            // :TODO: Have a maximum slope. going from a to high a is pretty steep
            let m = (anchors.last!.stemBottom - anchors.first!.stemBottom) /
                (anchors.last!.stemX - anchors.first!.stemX)
            let intercepts = anchors.map { $0.stemBottom - $0.stemX * m }
            slope = Slope(m: m, c: intercepts.min { abs($0) < abs($1) }!)
        } else {
            throw PdfError.singleNoteBeam
        }

        segments = Self.beamSegments(for: anchors, slope: slope)
        stemExtensions = anchors.compactMap { [slope] anchor in
            let slopeY = slope.height(at: anchor.stemX)
            let height = anchor.stemBottom - slopeY
            guard height > 0.01 else { return nil }
            return StemExtension(start: CGPoint(x: anchor.stemX, y: slopeY), height: height)
        }
    }

    private static func beamSegments(for noteAnchors: [Note.Anchors], slope: Slope) -> ([Segment]) {
        var segments: [Segment] = []

        var startStack: [Int] = []

        var flagTypes = noteAnchors.map(\.flagType)
        flagTypes.append(.none)

        for (index, flagType) in flagTypes.enumerated() {
            let targetBeamCount = switch flagType {
            case let .beam(count): count
            case .flag, .none: 0
            }

            while targetBeamCount > startStack.count {
                startStack.append(index)
            }

            while targetBeamCount < startStack.count && !startStack.isEmpty {
                let beamStartIndex = startStack.popLast()!
                let beamStackCount = startStack.count

                if beamStartIndex == index - 1 {
                    let startX = noteAnchors[beamStartIndex].stemX
                    // right by default (1), left whenever the beam below this is also ending (-1)
                    let direction: CGFloat = (targetBeamCount < startStack.count) ? -1 : 1
                    let xOffset = direction * Layout.noteBeamPartialExtension
                    let endX = startX + xOffset
                    segments.append(Segment(startX: startX, endX: endX, slope: slope, stackIndex: beamStackCount))
                } else {
                    let startX = noteAnchors[beamStartIndex].stemX
                    let endX = noteAnchors[index - 1].stemX
                    segments.append(Segment(startX: startX, endX: endX, slope: slope, stackIndex: beamStackCount))
                }
            }
        }

        return segments
    }
}

#endif // !os(Linux)
