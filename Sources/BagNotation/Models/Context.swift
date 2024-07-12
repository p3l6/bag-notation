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

    init(timeSignature: TimeSignature,
         noteLength: Duration,
         previousPitch: Pitch,
         tempo: Int?,
         variation: Variation,
         upcomingAnnotation: String?,
         upcomingFermata: Bool,
         upcomingAccidental: Accidental?) {
        self.timeSignature = timeSignature
        self.noteLength = noteLength
        self.previousPitch = previousPitch
        self.tempo = tempo
        self.variation = variation
        self.upcomingAnnotation = upcomingAnnotation
        self.upcomingFermata = upcomingFermata
        self.upcomingAccidental = upcomingAccidental
    }

    init(from base: FlowContext,
         timeSignature: TimeSignature? = nil,
         noteLength: Duration? = nil,
         previousPitch: Pitch? = nil,
         tempo: Int? = nil,
         variation: Variation? = nil,
         upcomingAnnotation: String? = nil, clearingAnnotation: Bool = false,
         upcomingFermata: Bool? = nil,
         upcomingAccidental: Accidental? = nil, clearingAccidental: Bool = false) {
        self.timeSignature = timeSignature ?? base.timeSignature
        self.noteLength = noteLength ?? base.noteLength
        self.previousPitch = previousPitch ?? base.previousPitch
        self.tempo = tempo ?? base.tempo
        self.variation = variation ?? base.variation
        self.upcomingAnnotation = clearingAnnotation ? nil : upcomingAnnotation ?? base.upcomingAnnotation
        self.upcomingFermata = upcomingFermata ?? base.upcomingFermata
        self.upcomingAccidental = clearingAccidental ? nil : upcomingAccidental ?? base.upcomingAccidental
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
