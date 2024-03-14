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
    let variation: String?
    let previousPitch: Pitch

    init(timeSignature: TimeSignature, 
         noteLength: Duration,
         previousPitch: Pitch,
         tempo: Int?,
         variation: String?
    ) {
        self.timeSignature = timeSignature
        self.noteLength = noteLength
        self.previousPitch = previousPitch
        self.tempo = tempo
        self.variation = variation
    }

    init(from base: FlowContext, 
         timeSignature: TimeSignature? = nil,
         noteLength: Duration? = nil,
         previousPitch: Pitch? = nil,
         tempo: Int? = nil,
         variation: String? = nil
    ) {
        self.timeSignature = timeSignature ?? base.timeSignature
        self.noteLength = noteLength ?? base.noteLength
        self.previousPitch = previousPitch ?? base.previousPitch
        self.tempo = tempo ?? base.tempo
        // TODO: cannot clear this value back to nil
        self.variation = variation ?? base.variation
    }
}

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
}
