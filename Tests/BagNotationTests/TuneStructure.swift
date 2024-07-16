//
//  TuneStructure.swift
//  Bag Notation
//

@testable import BagNotation
import Testing

struct TuneStructure {
    @Test
    func multipleTunes() throws {
        let source = """
            ---
            title: First 
            trad
            style: jig
            ---
            |: abc def :|

            ---
            title: Second 
            trad
            style: 6/8 March
            ---
            || abc def ||
            """

        let doc = try makeFile(from: source)
        #expect(doc.tunes.count == 2)
    }

    @Test
    func blankLines() throws {
        let source = """



            ---
            title: First 
            trad
            style: jig
            ---


            |: abc def :|
            |: abc def :|


            |: abc def :|
            |: abc def :|
            """

        let doc = try makeFile(from: source)
        #expect(doc.tunes.count == 1)
        #expect(doc.tunes[0].lines.count == 4)
    }

    @Test
    func tunesWithoutNotes() throws {
        let source = """
            ---
            title: First 
            trad
            style: jig
            ---
            """

        let doc = try makeFile(from: source)
        #expect(doc.tunes.count == 1)
        #expect(doc.tunes[0].lines.count == 0)
    }
}
