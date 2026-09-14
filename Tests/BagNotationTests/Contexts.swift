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
        #expect(doc.tunes[0].context.tuneNumber == 1)
        #expect(doc.tunes[1].context.tuneNumber == 2)
    }

    @Test
    func lineNumber() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[0].context.lineNumber == 1)
        #expect(doc.tunes[0].lines[1].context.lineNumber == 2)
        #expect(doc.tunes[1].lines[0].context.lineNumber == 1)
    }

    @Test
    func barNumber() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[0].voices[0].bars[0].context.barNumber == 1)
        #expect(doc.tunes[0].lines[0].voices[0].bars[2].context.barNumber == 3)
        #expect(doc.tunes[0].lines[1].voices[0].bars[2].context.barNumber == 3)
    }

    @Test
    func timeSignature() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[0].voices[0].bars[0].context.timeSignature == .time68)
        #expect(doc.tunes[0].lines[1].voices[0].bars[1].context.timeSignature == .time44)
        #expect(doc.tunes[0].lines[2].voices[0].bars[0].context.timeSignature == .time44)
        #expect(doc.tunes[1].lines[0].voices[0].bars[0].context.timeSignature == .time68)
    }

    @Test
    func noteLenth() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[0].voices[0].bars[0].notes[0].context.cluster.noteLength == .eighth)
        #expect(doc.tunes[0].lines[0].voices[0].bars[1].notes[0].context.cluster.noteLength == .quarter)
        #expect(doc.tunes[0].lines[1].voices[0].bars[0].notes[0].context.cluster.noteLength == .quarter)
        #expect(doc.tunes[1].lines[0].voices[0].bars[0].notes[0].context.cluster.noteLength == .eighth)
    }

    @Test
    func variation() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[0].lines[2].voices[0].bars[1].clusters[0].variation == .none)
        #expect(doc.tunes[0].lines[2].voices[0].bars[1].clusters[1].variation == .start(label: "1"))
        #expect(doc.tunes[0].lines[2].voices[0].bars[1].clusters[2].variation == .startAndEnd(label: "2"))
        #expect(doc.tunes[0].lines[2].voices[0].bars[1].clusters[3].variation == .none)
    }

    @Test
    func voice() throws {
        let doc = try makeFile(from: source)
        #expect(doc.tunes[1].lines[0].voices.count == 2)
        #expect(doc.tunes[1].lines[0].voices[0].context.voiceNumber == 0)
        #expect(doc.tunes[1].lines[0].voices[1].context.voiceNumber == 1)
        #expect(doc.tunes[1].lines[1].voices.count == 2)
        #expect(doc.tunes[1].lines[1].voices[0].context.voiceNumber == 0)
        #expect(doc.tunes[1].lines[1].voices[1].context.voiceNumber == 1)
        #expect(doc.tunes[1].lines[2].voices.count == 3)
        #expect(doc.tunes[1].lines[3].voices.count == 3)
    }

    @Test
    func variationEndsAtLine() throws {
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
        #expect(doc.tunes[0].lines[0].voices[0].bars[0].clusters[0].variation == .start(label: "1"))
        #expect(doc.tunes[0].lines[0].voices[0].bars[1].clusters[0].variation == .active)
        #expect(doc.tunes[0].lines[0].voices[0].bars[2].clusters[1].variation == .end)
        #expect(doc.tunes[0].lines[1].voices[0].bars[0].clusters[0].variation == .none)
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

    var clusters: [Cluster] {
        contents.compactMap {
            switch $0 {
            case let .cluster(cluster): cluster
            default: nil
            }
        }
    }
}
