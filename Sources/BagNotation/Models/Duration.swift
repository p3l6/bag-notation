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
