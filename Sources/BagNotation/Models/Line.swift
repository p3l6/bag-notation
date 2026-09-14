//
//  Line.swift
//  Bag Notation
//

public struct Line {
    public struct Context {
        let tune: Tune.Context

        /// First line is 1
        let lineNumber: Int
        let voiceCount: Int
    }

    let context: Context
    let voices: [Voice]
    var melody: Voice { voices[0] }
}

// TODO: bubble the leading barline up to the line
// error if they don't match
// maybe verify other barlines in the line match as well

public struct Voice {
    public struct Context {
        let line: Line.Context

        /// Melody is voice 0
        let voiceNumber: Int
        let barCount: Int
    }

    let context: Voice.Context
    let isHarmony: Bool
    let bars: [Bar]
    let leadingBarline: Barline?
}
