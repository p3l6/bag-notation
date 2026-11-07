//
//  Line.swift
//  Bag Notation
//

public struct Line {
    public struct Context {
        public let tune: Tune.Context
        public var identifier: String { "\(tune.identifier)l\(lineNumber)" }
        public let sourceRange: SourceRange

        /// First line is 1
        public let lineNumber: Int
        public let voiceCount: Int
    }

    public let context: Context
    public let voices: [Voice]
    public var melody: Voice { voices[0] }
}

// TODO: bubble the leading barline up to the line
// error if they don't match
// maybe verify other barlines in the line match as well

public struct Voice {
    public struct Context {
        public let line: Line.Context
        public var identifier: String { "\(line.identifier)v\(voiceNumber)" }
        public let sourceRange: SourceRange

        /// Melody is voice 0
        public let voiceNumber: Int
        public let barCount: Int
    }

    public let context: Voice.Context
    public let isHarmony: Bool
    public let bars: [Bar]
    public let leadingBarline: Barline?
}
