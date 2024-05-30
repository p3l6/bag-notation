//
//  Header.swift
//  Bag Notation
//

public struct Header {
    let title: String
    let style: TuneStyle
    let composer: String
    let arranger: String?
    let noteLength: Duration
    let timeSignature: TimeSignature
    let tempo: Int?
}

public enum TuneStyle {
    case march(timeSig: TimeSignature?)

    case strathspey
    case reel
    case hornpipe
    case jig(timeSig: TimeSignature?)

    case slowAir
    case slowMarch
    case piob

    var impliedTimeSignature: TimeSignature? {
        switch self {
        case let .march(timeSig): timeSig
        case let .jig(timeSig): timeSig
        case .reel: .time22
        case .hornpipe: .time24
        case .strathspey: .time44
        default: nil
        }
    }
}

public enum TimeSignature {
    case time22
    case time24
    case time34
    case time44
    case time54
    case time68
    case time98
    case time128

    var beatLength: Duration {
        switch self {
        case .time22: .half
        case .time68, .time98, .time128: .quarterDotted
        case .time24, .time34, .time44, .time54: .quarter
        }
    }

    var beatsPerBar: Int {
        switch self {
        case .time22, .time24, .time68: 2
        case .time34, .time98: 3
        case .time44, .time128: 4
        case .time54: 5
        }
    }
}

// MARK: Create from strings

extension TuneStyle {
    static func from(string: String) throws -> TuneStyle {
        switch string.lowercased() {
        case "march": .march(timeSig: nil)
        case "2/4 march": .march(timeSig: .time24)
        case "3/4 march": .march(timeSig: .time34)
        case "4/4 march": .march(timeSig: .time44)
        case "5/4 march": .march(timeSig: .time54)
        case "6/8 march": .march(timeSig: .time68)
        case "9/8 march": .march(timeSig: .time98)
        case "12/8 march": .march(timeSig: .time128)

        case "strathspey": .strathspey
        case "reel": .reel
        case "hornpipe": .hornpipe
        case "jig": .jig(timeSig: .time68)
        case "9/8 jig": .jig(timeSig: .time98)
        case "12/8 jig": .jig(timeSig: .time128)

        case "slow air": .slowAir
        case "slow march": .slowMarch
        case "piob", "piobaireachd": .piob
        default: throw ModelParseError.invalidStyle
        }
    }
}

extension TimeSignature {
    static func from(string: String) throws -> TimeSignature {
        switch string {
        case "2/2": .time22
        case "2/4": .time24
        case "3/4": .time34
        case "4/4": .time44
        case "5/4": .time54
        case "6/8": .time68
        case "9/8": .time98
        case "12/8": .time128
        default: throw ModelParseError.invalidTimeSignature
        }
    }
}

extension String {
    func toTuneStyle() throws -> TuneStyle { try TuneStyle.from(string: self) }
    func toTimeSignature() throws -> TimeSignature { try TimeSignature.from(string: self) }
}
