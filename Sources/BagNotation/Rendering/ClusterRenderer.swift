//
//  ClusterRenderer.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

final class ClusterRenderer: BaseRenderable, Renderable<Cluster> {
    let cluster: Cluster
    private var beams = [Beam]()

    init(inside box: BoundingBox, rendering cluster: Cluster) {
        self.cluster = cluster
        super.init(inside: box)
    }

    func render(in graphics: RenderCanvas) {
        for beam in beams {
            beam.segments.forEach { $0.draw(in: graphics) }
            beam.flags.forEach { $0.draw(in: graphics) }
        }
    }

    func directChildren() throws -> [any Renderable] {
        let noteBoxes = try layout(.horizontal, cluster.notes)
        let noteRenderers = cluster.notes.enumerated().map { index, note in
            NoteRenderer(inside: noteBoxes[index], rendering: note)
        }

        beams = noteRenderers
            .split { $0.note.duration.beamCount == 0 }
            .filter { $0.count > 1 }
            .map { Beam(noteRenderers: Array($0)) }

        return noteRenderers
    }
}

extension Cluster: Sizable {
    var height: Length { .full }
    var width: Length {
        notes.map(\.width).sum
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

    struct Flag {
        let startX: CGFloat
        let direction: CGFloat
        let slope: Slope
        let stackIndex: Int

        func draw(in graphics: RenderCanvas) {
            let offsetY = CGFloat(stackIndex) * (Layout.noteBeamLineWidth + Layout.noteBeamSeparation)
            let xOffset = direction * Layout.noteBeamPartialExtension
            let endX = startX + xOffset

            graphics.drawLine(from: CGPoint(x: startX, y: slope.height(at: startX) + offsetY),
                              to: CGPoint(x: endX, y: slope.height(at: endX) + offsetY),
                              width: Layout.noteBeamLineWidth)
        }
    }

    let segments: [Segment]
    let flags: [Flag]
    let slope: Slope

    init(noteRenderers: [NoteRenderer]) {
        if noteRenderers.count > 1 {
            let m = (noteRenderers.last!.stemBottom - noteRenderers.first!.stemBottom) /
                (noteRenderers.last!.stemX - noteRenderers.first!.stemX)
            slope = Slope(m: m, c: noteRenderers.first!.stemBottom - noteRenderers.first!.stemX * m)
        } else {
            slope = Slope(m: 0, c: noteRenderers.first!.stemBottom)
        }

        (segments, flags) = Self.beamSegments(for: noteRenderers, slope: slope)

        for noteRenderer in noteRenderers {
            noteRenderer.drawsFlag = false
            noteRenderer.stemBottom = slope.height(at: noteRenderer.stemX)
        }
    }

    private static func beamSegments(for noteRenderers: [NoteRenderer], slope: Slope) -> ([Segment], [Flag]) {
        var segments: [Segment] = []
        var flags: [Flag] = []

        var startStack: [Int] = []

        var beamCounts: [Int] = noteRenderers.map(\.note.duration.beamCount)
        beamCounts.append(0)

        for (index, targetBeamCount) in beamCounts.enumerated() {
            while targetBeamCount > startStack.count {
                startStack.append(index)
            }

            while targetBeamCount < startStack.count && !startStack.isEmpty {
                let beamStartIndex = startStack.popLast()!
                let beamStackCount = startStack.count

                if beamStartIndex == index - 1 {
                    let startX = noteRenderers[beamStartIndex].stemX
                    let direction: CGFloat = if beamStartIndex == noteRenderers.startIndex {
                        1
                    } else if beamStartIndex == noteRenderers.index(before: noteRenderers.endIndex) {
                        -1
                    } else if noteRenderers[beamStartIndex + 1].note.duration.beamCount > 0 {
                        1
                    } else {
                        -1
                    }
                    flags.append(Flag(startX: startX, direction: direction, slope: slope, stackIndex: beamStackCount))
                } else {
                    let startX = noteRenderers[beamStartIndex].stemX
                    let endX = noteRenderers[index - 1].stemX
                    segments.append(Segment(startX: startX, endX: endX, slope: slope, stackIndex: beamStackCount))
                }
            }
        }

        return (segments, flags)
    }
}

#endif // !os(Linux)
