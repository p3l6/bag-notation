//
//  Line.swift
//  Bag Notation
//

public struct Line {
    let context: LineContext
    let voices: [Voice]
    var melody: Voice { voices[0] }

    init(context: LineContext, voices: [Voice]) {
        self.context = context
        self.voices = voices
    }
}

// TODO: bubble the leading barline up to the line
// error if they don't match
// maybe verify other barlines in the line match as well

public struct Voice {
    let context: VoiceContext
    let isHarmony: Bool
    let bars: [Bar]
    let leadingBarline: Barline?

    init(context: VoiceContext, isHarmony: Bool, bars: [Bar], leadingBarline: Barline?) {
        self.context = context
        self.isHarmony = isHarmony
        self.bars = bars
        self.leadingBarline = leadingBarline
    }
}
