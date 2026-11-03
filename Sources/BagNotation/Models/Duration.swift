//
//  Duration.swift
//  Bag Notation
//

import Foundation

public enum Duration: Comparable {
    // shortest to longest, for auto-comparable conformance
    case sixtyfourth
    case sixtyfourthDotted
    case thirtysecond
    case thirtysecondDotted
    case sixteenth
    case sixteenthDotted
    case eighth
    case eighthDotted
    case quarter
    case quarterDotted
    case half
    case halfDotted
    case whole
    case wholeDotted

    func doubled() throws -> Duration {
        switch self {
        case .wholeDotted: throw ModelParseError.invalidNoteLength(why: "Too long")
        case .whole: throw ModelParseError.invalidNoteLength(why: "Too long")
        case .halfDotted: .wholeDotted
        case .half: .whole
        case .quarterDotted: .halfDotted
        case .quarter: .half
        case .eighthDotted: .quarterDotted
        case .eighth: .quarter
        case .sixteenthDotted: .eighthDotted
        case .sixteenth: .eighth
        case .thirtysecondDotted: .sixteenthDotted
        case .thirtysecond: .sixteenth
        case .sixtyfourthDotted: .thirtysecondDotted
        case .sixtyfourth: .thirtysecond
        }
    }

    func cut() throws -> Duration {
        switch self {
        case .wholeDotted: .halfDotted
        case .whole: .half
        case .halfDotted: .quarterDotted
        case .half: .quarter
        case .quarterDotted: .eighthDotted
        case .quarter: .eighth
        case .eighthDotted: .sixteenthDotted
        case .eighth: .sixteenth
        case .sixteenthDotted: .thirtysecondDotted
        case .sixteenth: .thirtysecond
        case .thirtysecondDotted: .sixtyfourthDotted
        case .thirtysecond: .sixtyfourth
        case .sixtyfourthDotted: throw ModelParseError.invalidNoteLength(why: "Too short")
        case .sixtyfourth: throw ModelParseError.invalidNoteLength(why: "Too short")
        }
    }

    func dotted() throws -> Duration {
        switch self {
        case .wholeDotted: throw ModelParseError.invalidNoteLength(why: "Already dotted")
        case .whole: .wholeDotted
        case .halfDotted: throw ModelParseError.invalidNoteLength(why: "Already dotted")
        case .half: .halfDotted
        case .quarterDotted: throw ModelParseError.invalidNoteLength(why: "Already dotted")
        case .quarter: .quarterDotted
        case .eighthDotted: throw ModelParseError.invalidNoteLength(why: "Already dotted")
        case .eighth: .eighthDotted
        case .sixteenthDotted: throw ModelParseError.invalidNoteLength(why: "Already dotted")
        case .sixteenth: .sixteenthDotted
        case .thirtysecondDotted: throw ModelParseError.invalidNoteLength(why: "Already dotted")
        case .thirtysecond: .thirtysecondDotted
        case .sixtyfourthDotted: throw ModelParseError.invalidNoteLength(why: "Already dotted")
        case .sixtyfourth: .sixtyfourthDotted
        }
    }

    var isDotted: Bool {
        switch self {
        case .sixtyfourthDotted,
             .thirtysecondDotted,
             .sixteenthDotted,
             .eighthDotted,
             .quarterDotted,
             .halfDotted,
             .wholeDotted:
            true
        default:
            false
        }
    }
}

// MARK: Create from strings

extension Duration {
    /// Tries to modify this duration by a string such as "+" or "//"
    func modified(by modifier: String) throws -> Duration {
        switch modifier {
        case "+": try doubled()
        case "+.": try doubled().dotted()
        case "++": try doubled().doubled()
        case "++.": try doubled().doubled().dotted()
        case "+++": try doubled().doubled().doubled()
        case "+++.": try doubled().doubled().doubled().dotted()
        case "++++": try doubled().doubled().doubled().doubled()
        case "/": try cut()
        case "//": try cut().cut()
        case "///": try cut().cut().cut()
        case "////": try cut().cut().cut().cut()
        case ".": try dotted()
        case "/.": try cut().dotted()
        default: throw ModelParseError.invalidNoteLength(why: "Failed to parse length modifiers")
        }
    }
}

extension String {
    func toDuration(modifying base: Duration) throws -> Duration { try base.modified(by: self) }
}

// MARK: Summation and cumulative comparisons

struct DurationSummation {
    /// Uses a private fixed point counter of 128 units per wholeNote
    private(set) var totalUnits = 0

    init() {}
    
    init(_ duration: Duration) {
        totalUnits = Self.units(for: duration)
    }

    init(_ durations: [Duration]) {
        totalUnits = durations.reduce(0) { $0 + Self.units(for: $1) }
    }

    private static  func units(for duration: Duration) -> Int {
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

    private static func duration(for units: Int) -> Duration {
        switch units {
        case ...2: .sixtyfourth
        case 3..<4: .sixtyfourthDotted
        case 4..<6: .thirtysecond
        case 6..<8: .thirtysecondDotted
        case 8..<12: .sixteenth
        case 12..<16: .sixteenthDotted
        case 16..<24: .eighth
        case 24..<32: .eighthDotted
        case 32..<48: .quarter
        case 48..<64: .quarterDotted
        case 64..<96: .half
        case 96..<128: .halfDotted
        case 128..<192: .whole
        default: .wholeDotted
        }
    }

    mutating func add(_ other: DurationSummation) {
        totalUnits += other.totalUnits
    }

    mutating func add(_ duration: Duration) {
        totalUnits += Self.units(for: duration)
    }

    func beats(withSize: Duration) -> (beats: Int, extra: Duration?) {
        let beatUnits = Self.units(for: withSize)
        let beats = totalUnits / beatUnits
        let extraUnits = totalUnits % beatUnits

        return (beats, Self.duration(for: extraUnits))
    }
}
