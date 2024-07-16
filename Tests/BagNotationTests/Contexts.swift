//
//  Contexts.swift
//  Bag Notation
//

@testable import BagNotation
import Testing

struct Contexts {
    let source = """
        ---
        title: First 
        trad
        style: jig
        ---
        |: abc def | (note: quarter) abc def | abc def  |
           abc def | (time: 4/4) abc def | abc def :|
        || abc def | abc (v: 1) abc (v: 2) def (v) abc | abc def ||

        ---
        title: Second 
        trad
        style: 6/8 March
        ---
            || abc def | abc def | abc def |
        (h) || ecd agb | def abc | def abc |
               abc def | abc def | abc def ||
        (h)    abc def | abc def | abc def ||
            || abc def | abc def | abc def |
        (h) || ecd agb | def abc | def abc |
        (h) || ecd agb | def abc | def abc |
               abc def | abc def | abc def ||
        (h)    abc def | abc def | abc def ||
        (h)    abc def | abc def | abc def ||
        """
    @Test
    func tuneNumber() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].context.body.tuneNumber == 1)
        #expect(doc.tunes[1].context.body.tuneNumber == 2)
    }

    @Test
    func lineNumber() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[0].context.body.lineNumber == 1)
        #expect(doc.tunes[0].lines[1].context.body.lineNumber == 2)
        #expect(doc.tunes[1].lines[0].context.body.lineNumber == 1)
    }

    @Test
    func barNumber() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[0].voices[0].bars[0].context.body.barNumber == 1)
        #expect(doc.tunes[0].lines[0].voices[0].bars[2].context.body.barNumber == 3)
        #expect(doc.tunes[0].lines[1].voices[0].bars[2].context.body.barNumber == 3)
    }

    @Test
    func timeSignature() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[0].voices[0].bars[0].notes[0].context.head.timeSignature == .time68)
        #expect(doc.tunes[0].lines[1].voices[0].bars[1].notes[0].context.head.timeSignature == .time44)
        #expect(doc.tunes[0].lines[2].voices[0].bars[0].notes[0].context.head.timeSignature == .time44)
        #expect(doc.tunes[1].lines[0].voices[0].bars[0].notes[0].context.head.timeSignature == .time68)
    }

    @Test
    func noteLenth() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[0].voices[0].bars[0].notes[0].context.head.noteLength == .eighth)
        #expect(doc.tunes[0].lines[0].voices[0].bars[1].notes[0].context.head.noteLength == .quarter)
        #expect(doc.tunes[0].lines[1].voices[0].bars[0].notes[0].context.head.noteLength == .quarter)
        #expect(doc.tunes[1].lines[0].voices[0].bars[0].notes[0].context.head.noteLength == .eighth)
    }

    @Test
    func variation() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[2].voices[0].bars[1].notes[0].context.head.variation == .none)
        #expect(doc.tunes[0].lines[2].voices[0].bars[1].notes[3].context.head.variation == .other(label: "1"))
        #expect(doc.tunes[0].lines[2].voices[0].bars[1].notes[6].context.head.variation == .other(label: "2"))
        #expect(doc.tunes[0].lines[2].voices[0].bars[1].notes[9].context.head.variation == .none)
    }

    @Test
    func voice() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[1].lines[0].voices.count == 2)
        #expect(doc.tunes[1].lines[0].voices[0].context.body.voiceNumber == 0)
        #expect(doc.tunes[1].lines[0].voices[1].context.body.voiceNumber == 1)
        #expect(doc.tunes[1].lines[1].voices.count == 2)
        #expect(doc.tunes[1].lines[1].voices[0].context.body.voiceNumber == 0)
        #expect(doc.tunes[1].lines[1].voices[1].context.body.voiceNumber == 1)
        #expect(doc.tunes[1].lines[2].voices.count == 3)
        #expect(doc.tunes[1].lines[3].voices.count == 3)
    }

    @Test
    func voiceEndsAtLine() throws {
        let source = """
            ---
            title: First
            trad
            style: jig
            ---
            (v: 1) |: abc def | abc def | abc def  |
                      abc def | abc def | abc def :|
            """

        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[0].voices[0].bars[0].context.head.variation == .other(label: "1"))
        #expect(doc.tunes[0].lines[0].voices[0].bars[2].notes[5].context.tail.variation == .other(label: "1"))
        #expect(doc.tunes[0].lines[0].voices[0].context.tail.variation == .none)
        #expect(doc.tunes[0].lines[1].voices[0].bars[0].context.head.variation == .none)
    }
}

private extension Bar {
    var notes: [Note] {
        contents.flatMap {
            switch $0 {
            case let .cluster(cluster): cluster.notes
            default: [Note]()
            }
        }
    }
}
