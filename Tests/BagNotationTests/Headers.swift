//
//  Headers.swift
//  Bag Notation
//

@testable import BagNotation
import Testing

struct Headers {
    @Test
    func title() throws {
        let source = """
            title: First tune
            by: trad
            style: jig
            """

        let header = try makeHeader(from: source)
        #expect(header.title == "First tune")
    }

    @Test
    func composer() throws {
        let source = """
            title: First
            by: trad
            style: jig
            """

        let header = try makeHeader(from: source)
        #expect(header.composer == "trad")
    }

    @Test
    func trad() throws {
        let source = """
            title: First tune
            trad
            style: jig
            """

        let header = try makeHeader(from: source)
        #expect(header.title == "First tune")
        #expect(header.composer == "trad")
    }

    @Test
    func timeSignature() throws {
        let source = """
            title: First
            by: trad
            style: jig
            time: 4/4
            """

        let header = try makeHeader(from: source)
        #expect(header.timeSignature == .time44)
    }

    @Test
    func noteLength() throws {
        let source = """
            title: First
            by: trad
            style: jig
            time: 4/4
            note: quarter
            """
        let header = try makeHeader(from: source)
        #expect(header.noteLength == .quarter)
    }

    @Test
    func impliedTimeSignature() throws {
        let source = """
            title: First
            by: trad
            style: jig
            """

        let header = try makeHeader(from: source)
        #expect(header.timeSignature == .time68)

//    TODO: test the rest. let knownTypes = [..:..] ; for known: assertEqual
    }

    @Test
    func missingTitle() throws {
        let source = """
            by: trad
            style: jig
            """

        #expect(throws: LocatedModelParseError.self) { try makeHeader(from: source) }
    }

    @Test
    func missingComposer() throws {
        let source = """
            title: First
            style: jig
            """

        #expect(throws: LocatedModelParseError.self) { try makeHeader(from: source) }
    }

    @Test
    func missingStyle() throws {
        let source = """
            title: First
            by: trad
            time: 4/4
            """

        #expect(throws: LocatedModelParseError.self) { try makeHeader(from: source) }
    }

    @Test
    func missingTimeSignature() throws {
        let source = """
            title: First
            by: trad
            style: style_without_inferred_time
            """

        #expect(throws: LocatedModelParseError.self) { try makeHeader(from: source) }
    }

    @Test
    func duplicateFields() throws {
        #expect(throws: LocatedModelParseError.self) { try makeHeader(from: """
            title: First
            by: trad
            title: Second
            style: jig
            """)}

        #expect(throws: LocatedModelParseError.self) { try makeHeader(from: """
            style: march
            title: First
            by: trad
            style: jig
            """)}
    }
    
    @Test
    func conflictingComposers() throws {
        #expect(throws: LocatedModelParseError.self) { try makeHeader(from: """
            title: First
            by: someone
            trad
            style: jig
            """)}
    }
}
