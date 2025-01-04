//
//  Bar.swift
//  Bag Notation
//

public struct Bar {
    let context: BarContext
    
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

    init(context: BarContext, contents: [BarContent], trailingBarline: Barline) {
        self.context = context
        self.contents = contents
        self.trailingBarline = trailingBarline == .double && context.body.barNumber == context.body.voice.barCount ? .partEnd : trailingBarline
    }

    var isPickup: Bool {
        // TODO: improve logic when contents is only rests
        context.body.barNumber == 1 && contents.count < context.tail.timeSignature.beatsPerBar
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
