//
//  Note.swift
//  Bag Notation
//

public struct Note {
    public struct Context {
        public let cluster: Cluster.Context
        public var identifier: String { "\(cluster.identifier)n\(noteNumber)" }
        public let sourceRange: SourceRange

        /// First note is 1
        public let noteNumber: Int

        public let tupletSize: Int
    }

    public let context: Context
    public let pitch: Pitch
    public let embellishment: Embellishment?
    public let duration: Duration
    public let annotation: String?
    public let fermata: Bool
    public let accidental: Accidental?
    public let grouping: NoteGrouping
    /// A second pitch to display with the primary, as a chord
    public let chord: Pitch?
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

public enum NoteGrouping: Equatable {
    public enum Kind: Equatable {
        case tie
        case slur
        case tuplet(size: Int)
    }

    case none
    case start(Kind)
    case ongoing(Kind)
    case end(Kind)
    case transition(ending: Kind, starting: Kind)
}

public enum NoteParseError: Error {
    case unknownPitch
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
