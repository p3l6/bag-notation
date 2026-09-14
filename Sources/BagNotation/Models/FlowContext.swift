//
//  FlowContext.swift
//  Bag Notation
//

/// A type of context that "flows" from one element to the next, as read from the file naturally.
///
/// This is contrast to each nodes context, which describes the context of all nodes below it in the tree.
/// Flow Context is for aggregating information as the file is being parsed. This information is then
/// distilled into the node or the node's specific context
struct FlowContext {
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

        previousPitch = .e
        variation = .none
        upcomingAnnotation = nil
        upcomingFermata = false
        upcomingAccidental = nil
        upcomingChord = nil
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

typealias ContextGroup<Body> = (head: FlowContext, body: Body, tail: FlowContext)
