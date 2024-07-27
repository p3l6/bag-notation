//
//  Context.swift
//  Bag Notation
//

public struct Context<BodyContext> {
    let head: FlowContext
    let body: BodyContext
    let tail: FlowContext
}

/// A type of context that "flows" from one element to the next, as read from the file naturally.
///
/// This is contrast to each nodes `BodyContext`, which describes the context of all nodes below it in the tree
public struct FlowContext {
    let timeSignature: TimeSignature
    let noteLength: Duration
    let tempo: Int?
    let variation: Variation
    
    let previousPitch: Pitch

    let upcomingAnnotation: String?
    let upcomingFermata: Bool
    let upcomingAccidental: Accidental?
    let upcomingChord: Pitch?

    init(timeSignature: TimeSignature, noteLength: Duration, tempo: Int?) {
        self.timeSignature = timeSignature
        self.noteLength = noteLength
        self.tempo = tempo

        self.previousPitch = .e
        self.variation = .none
        self.upcomingAnnotation = nil
        self.upcomingFermata = false
        self.upcomingAccidental = nil
        self.upcomingChord = nil
    }

    init(from base: FlowContext,
         timeSignature: TimeSignature? = nil,
         noteLength: Duration? = nil,
         previousPitch: Pitch? = nil,
         tempo: Int? = nil,
         variation: Variation? = nil,
         upcomingAnnotation: String? = nil,
         upcomingFermata: Bool? = nil,
         upcomingAccidental: Accidental? = nil,
         upcomingChord: Pitch? = nil,
         clearingAllUpcoming: Bool = false) {
        self.timeSignature = timeSignature ?? base.timeSignature
        self.noteLength = noteLength ?? base.noteLength
        self.previousPitch = previousPitch ?? base.previousPitch
        self.tempo = tempo ?? base.tempo
        self.variation = variation ?? base.variation
        self.upcomingAnnotation = clearingAllUpcoming ? nil : upcomingAnnotation ?? base.upcomingAnnotation
        self.upcomingFermata = clearingAllUpcoming ? false : upcomingFermata ?? base.upcomingFermata
        self.upcomingAccidental = clearingAllUpcoming ? nil : upcomingAccidental ?? base.upcomingAccidental
        self.upcomingChord = clearingAllUpcoming ? nil : upcomingChord ?? base.upcomingChord
    }
}

enum Variation: Equatable {
    case none
    case other(label: String)
}

// MARK: Context Bodies

typealias DocContext = Context<DocContextBody>
public struct DocContextBody {
    let tuneCount: Int
}

typealias TuneContext = Context<TuneContextBody>
public struct TuneContextBody {
    /// First tune is 1
    let tuneNumber: Int
    let lineCount: Int
}

typealias LineContext = Context<LineContextBody>
public struct LineContextBody {
    let tune: TuneContextBody

    /// First line is 1
    let lineNumber: Int
    let voiceCount: Int
}

typealias VoiceContext = Context<VoiceContextBody>
public struct VoiceContextBody {
    let line: LineContextBody

    /// Melody is voice 0
    let voiceNumber: Int
    let barCount: Int
}

typealias BarContext = Context<BarContextBody>
public struct BarContextBody {
    let voice: VoiceContextBody

    /// First bar is 1
    var barNumber: Int
    let clusterCount: Int
}

typealias ClusterContext = Context<ClusterContextBody>
public struct ClusterContextBody {
    let bar: BarContextBody

    /// First cluster is 1
    let clusterNumber: Int
}

typealias NoteContext = Context<NoteContextBody>
public struct NoteContextBody {
    let cluster: ClusterContextBody

    // Zero when not in a tuplet
    let tupletSize: Int
    // First note in tuplet is 1
    let tupletNumber: Int
}
