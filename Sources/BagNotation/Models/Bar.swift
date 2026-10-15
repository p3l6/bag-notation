//
//  Bar.swift
//  Bag Notation
//

public struct Bar {
    public struct Context {
        let voice: Voice.Context
        var identifier: String { "\(voice.identifier)b\(barNumber)" }

        /// First bar is 1
        var barNumber: Int
        let clusterCount: Int
        /// Time signatures can only change on bar boundaries
        let timeSignature: TimeSignature
        /// True if the time signature has just changed for this bar, false if it continues from previous
        let timeSignatureChanged: Bool

        var isFirstBarOfTune: Bool {
            voice.line.lineNumber == 1 && barNumber == 1
        }
    }

    let context: Context

    enum BarContent {
        case cluster(cluster: Cluster)
        case rest(duration: Duration)
        case barRest
        /// A non-printing rest
        case spacer(duration: Duration)
        case barSpacer
    }

    let contents: [BarContent]
    let trailingBarline: Barline

    init(context: Context, contents: [BarContent], trailingBarline: Barline) {
        self.context = context
        self.contents = contents
        self.trailingBarline = trailingBarline == .double && context.barNumber == context.voice.barCount ? .partEnd : trailingBarline
    }

    /// A bar is a pickup if it is missing at least one full beat
    var isPickup: Bool {
        // Piob is too flexible with timing, and finds more false positives than correct.
        guard context.barNumber == 1, context.voice.line.tune.style != .piob else { return false }

        struct TimeAmount {
            let beatSize: Duration
            var beats: Int = 0
            var extra = 0

            private func units(for duration: Duration) -> Int {
                switch duration {
                case .sixtyfourth: 2
                case .sixtyfourthDotted: 3
                case .thirtysecond: 4
                case .thirtysecondDotted: 6
                case .sixteenth: 8
                case .sixteenthDotted: 12
                case .eighth: 16
                case .eighthDotted: 24
                case .quarter: 32
                case .quarterDotted: 48
                case .half: 64
                case .halfDotted: 96
                case .whole: 128
                case .wholeDotted: 192
                }
            }

            mutating func add(_ other: TimeAmount) {
                let beatUnits = units(for: beatSize)
                let totalUnits = beats * beatUnits
                    + extra
                    + other.beats * units(for: other.beatSize)
                    + other.extra

                beats = totalUnits / beatUnits
                extra = totalUnits % beatUnits
            }

            mutating func add(_ duration: Duration) {
                let beatUnits = units(for: beatSize)
                let totalUnits = extra + units(for: duration)

                beats += totalUnits / beatUnits
                extra = totalUnits % beatUnits
            }
        }

        var time = TimeAmount(beatSize: context.timeSignature.beatLength)

        for content in contents {
            switch content {
            case let .cluster(cluster): cluster.notes.map(\.duration).forEach { time.add($0) }
            case let .rest(duration): time.add(duration)
            case .barRest: return false
            case let .spacer(duration): time.add(duration)
            case .barSpacer: return false
            }
        }

        return time.beats <= context.timeSignature.beatsPerBar - (time.extra == 0 ? 1 : 2)
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
        case "|", "i": .plain
        case "|:", "i:": .repeatStart
        case ":|", ":i": .repeatEnd
        case "||", "ii", "i|", "|i": .double
        default: throw ModelParseError.invalidBarline
        }
    }
}

extension String {
    func toBarline() throws -> Barline { try Barline.from(string: self) }
}
