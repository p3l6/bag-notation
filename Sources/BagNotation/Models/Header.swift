//
//  Header.swift
//  Bag Notation
//

struct Header {
    let title: String
    let style: TuneStyle
    let composer: String
    let noteLength: Duration
    let timeSignature: TimeSignature
}

enum TimeSignature: String {
    case time22 = "2/2"
    case time24 = "2/4"
    case time34 = "3/4"
    case time44 = "4/4"
    case time54 = "5/4"
    case time68 = "6/8"
    case time98 = "9/8"
    case time128 = "12/8"
}

// TODO: This should be title case in output
enum TuneStyle: String {
    case march
    case march24 = "2/4 march"
    case march34 = "3/4 march"
    case march44 = "4/4 march"
    case march54 = "5/4 march"
    case march68 = "6/8 march"
    case march98 = "9/8 march"
    case march128 = "12/8 march"

    case strathspey
    case reel
    case hornpipe
    case jig
    case jig98 = "9/8 jig"
    case jig128 = "12/8 jig"

    case slowAir = "slow air"
    case slowMarch = "slow march"
    case piob = "piobaireachd"

    var impliedTimeSignature: TimeSignature? {
        switch self {
        case .reel: .time22
        case .march24, .hornpipe: .time24
        case .march34: .time34
        case .march44, .strathspey: .time44
        case .march68, .jig: .time68
        case .march98, .jig98: .time98
        case .march128, .jig128: .time128
        default: nil
        }
    }
}
