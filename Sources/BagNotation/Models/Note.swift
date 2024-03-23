//
//  Note.swift
//  Bag Notation
//

// Future embellishments:
// uxxd: e{fde}d ? No. 24, 63
// ttg: g{ege}g ? No. 64 (double tap on the piob high g)
// low g variation crunluath ?
// uw: taorluath a mach ? (on bcd)
// uww: crunluath a mach ? (on bcd)
// ?z: {geAfA}e ?
// ?z: {afege}f ? in No. 64

public struct Note {
    let context: NoteContext
    let pitch: Pitch
    let embellishment: Embellishment?
    let duration: Duration
    let tiedToNext: Bool
    let slurredToNext: Bool

    init(context: NoteContext, pitch: Pitch, embellishment: Embellishment?, duration: Duration, tied: Bool, slurred: Bool) {
        self.context = context
        self.pitch = pitch
        self.embellishment = embellishment
        self.duration = duration
        tiedToNext = tied
        slurredToNext = slurred
    }
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

extension String {
    func toPitch() throws -> Pitch { try Pitch.from(string: self) }
}

public enum NoteParseError: Error {
    case unknownPitch
    case unknownEmbellishment
}

// MARK: Create from strings

// TODO: Standarize these methods
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
