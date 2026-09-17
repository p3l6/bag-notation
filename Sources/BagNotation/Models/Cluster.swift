//
//  Cluster.swift
//  Bag Notation
//

public struct Cluster {
    public struct Context {
        let bar: Bar.Context

        /// First cluster is 1
        let clusterNumber: Int

        let noteLength: Duration
        let tempo: Int?

        var isFinalClusterOfVoice: Bool {
            bar.barNumber == bar.voice.barCount &&
                clusterNumber == bar.clusterCount
        }
    }

    let context: Context
    let notes: [Note]
    let variation: Variation
}

enum Variation: Equatable {
    /// No variation is active
    case none
    /// Applies to the first cluster in a chain, or when the label changes (ie from "1" to "2")
    case start(label: String)
    /// A variation is active
    case active
    /// Applies to a cluster that both starts (has a label) and is the final cluster of the chain of variations
    case startAndEnd(label: String)
    /// Applies to the final cluster in a chain of variations
    case end

    var convertedToEnding: Variation {
        switch self {
        case let .start(label): .startAndEnd(label: label)
        case .active: .end
        default: self
        }
    }

    var isEndable: Bool {
        switch self {
        case .active, .start: true
        default: false
        }
    }

    var isContinuation: Bool {
        switch self {
        case .active, .none: true
        default: false
        }
    }
}
