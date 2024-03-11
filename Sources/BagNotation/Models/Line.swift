//
//  Line.swift
//  Bag Notation
//

public struct Line {
    public struct Voice {
        let context: Context
        let isHarmony: Bool
        let bars: [Bar]
        let leadingBarline: Barline?
    }

    let context: Context
    let voices: [Voice]
    var melody: Voice { voices[0] }
}

// TODO: bubble the leading barline up to the line
// error if they don't match
// maybe verify other barlines in the line match as well
