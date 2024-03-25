//
//  Bar.swift
//  Bag Notation
//

public struct Bar {
    let context: BarContext

    let clusters: [Cluster]
    let trailingBarline: Barline

    init(context: BarContext, clusters: [Cluster], trailingBarline: Barline) {
        self.context = context
        self.clusters = clusters
        self.trailingBarline = trailingBarline == .double && context.body.barNumber == context.body.voice.barCount ? .partEnd : trailingBarline
    }

    var notes: [Note] { Array(clusters.map(\.notes).joined()) }
    var isPickup: Bool {
        context.body.barNumber == 1 && clusters.count < context.tail.timeSignature.beatsPerBar
    }
}

public enum Barline {
    case plain
    case repeatStart
    case repeatEnd
    case partStart
    case partEnd
    case double
}

// MARK: Create from strings

extension Barline {
    static func from(string: String) throws -> Barline {
        switch string {
        case "|": .plain
        case "|:": .repeatStart
        case ":|": .repeatEnd
        case "||": .double
        default: throw ModelParseError.invalidBarline
        }
    }
}

extension String {
    func toBarline() throws -> Barline { try Barline.from(string: self) }
}
