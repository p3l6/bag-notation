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

    var isPickup: Bool {
        // TODO: improve logic when contents is only rests
        // TODO: instead of counting clusters, count total duration (ie half notes)
        context.barNumber == 1 && contents.count < context.timeSignature.beatsPerBar
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
