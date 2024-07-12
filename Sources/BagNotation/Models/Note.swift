//
//  Note.swift
//  Bag Notation
//

public struct Note {
    let context: NoteContext
    let pitch: Pitch
    let embellishment: Embellishment?
    let duration: Duration
    let tiedToNext: Bool
    let slurredToNext: Bool
    let annotation: String?
    let fermata: Bool
    let accidental: Accidental?
}

public enum Pitch: Comparable {
    case lowG
    case lowA
    case c
    case b
    case d
    case e
    case f
    case highG
    case highA
}

public enum Accidental {
    case sharp, flat, natural
}

public enum NoteParseError: Error {
    case unknownPitch
    case unknownEmbellishment
}

// MARK: Create from strings

extension Pitch {
    static func from(string: String) throws -> Pitch {
        switch string {
        case "h", "m": .highA
        case "g", "y": .highG
        case "f", "u": .f
        case "e", "z": .e
        case "d", "p": .d
        case "c", "k": .c
        case "b", "j": .b
        case "a", "o": .lowA
        case "l", "q": .lowG
        default: throw NoteParseError.unknownPitch
        }
    }
}

extension String {
    func toPitch() throws -> Pitch { try Pitch.from(string: self) }
}
