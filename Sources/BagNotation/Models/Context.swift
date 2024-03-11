//
//  Context.swift
//  Bag Notation
//

public struct Context {
    var tuneNumber: Int = 0 // first tune is 1
    var lineNumberInTune: Int = 0 // first line is 1
    var barNumberInLine: Int = 0 // first bar is 1

    var barCountInLine: Int = 0

    var voiceNumber: Int = 0 // melody voice is 0
    var variation: String? // nil for no variation

    var timeSignature: TimeSignature = .time44 // placeholder will be overwritten
    var noteLength: Duration = .eighth // default note length
    var tempo: Int?
}
