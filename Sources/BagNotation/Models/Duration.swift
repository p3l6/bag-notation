//
//  File.swift
//  
//
//  Created by Paul Landers on 3/6/24.
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
        case .wholeDotted: throw ModelParseError.noteTooLong
        case .whole: throw ModelParseError.noteTooLong
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
        case .sixtyfourthDotted: throw ModelParseError.noteTooShort
        case .sixtyfourth: throw ModelParseError.noteTooShort
        }
    }

    func dotted() throws -> Duration {
        switch self {
        case .wholeDotted: throw ModelParseError.noteAlreadyDotted
        case .whole: .wholeDotted
        case .halfDotted: throw ModelParseError.noteAlreadyDotted
        case .half: .halfDotted
        case .quarterDotted: throw ModelParseError.noteAlreadyDotted
        case .quarter: .quarterDotted
        case .eighthDotted: throw ModelParseError.noteAlreadyDotted
        case .eighth: .eighthDotted
        case .sixteenthDotted: throw ModelParseError.noteAlreadyDotted
        case .sixteenth: .sixteenthDotted
        case .thirtysecondDotted: throw ModelParseError.noteAlreadyDotted
        case .thirtysecond: .thirtysecondDotted
        case .sixtyfourthDotted: throw ModelParseError.noteAlreadyDotted
        case .sixtyfourth: .sixtyfourthDotted
        }
    }

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
        default: throw ModelParseError.invalidNoteLength
        }
    }
}

public enum TimeSignature: String {
    case time22 = "2/2"
    case time24 = "2/4"
    case time34 = "3/4"
    case time44 = "4/4"
    case time54 = "5/4"
    case time68 = "6/8"
    case time98 = "9/8"
    case time128 = "12/8"

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
