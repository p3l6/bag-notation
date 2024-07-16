//
//  Comments.swift
//  Bag Notation
//

@testable import BagNotation
import Testing

struct Comments {
    @Test
    func leadingComments() throws {
        let source = """
            # top of file comment
            # another comment
            ---
            title: First 
            trad
            style: jig
            ---
            |: abc def :|

            # end of file comment
            """

        let doc = try makeFile(from: source)
        #expect(doc.tunes.count == 1)
        #expect(doc.tunes[0].lines.count == 1)
    }

    @Test
    func bodyComments() throws {
        let source = """
            ---
            title: First 
            trad
            style: jig
            ---
            |: abc def :|
            # body comment
            |: abc def :|

            """

        let doc = try makeFile(from: source)
        #expect(doc.tunes.count == 1)
        #expect(doc.tunes[0].lines.count == 2)
    }

    @Test
    func trailingLineComments() throws {
        let source = """
            ---
            title: First
            trad
            style: jig
            ---
            |: abc def :|  # trailing comment
            |: abc def :|

            """

        let doc = try makeFile(from: source)
        #expect(doc.tunes.count == 1)
        #expect(doc.tunes[0].lines.count == 2)
    }

    @Test
    func commentsBetweenTunes() throws {
        let source = """
            ---
            title: First 
            trad
            style: jig
            ---
            |: abc def :|
            |: abc def :|

            # between comment

            # another
            # comment


            ---
            title: Second 
            trad
            style: jig
            ---
            |: abc def :|

            """

        let doc = try makeFile(from: source)
        #expect(doc.tunes.count == 2)
        #expect(doc.tunes[0].lines.count == 2)
    }
}
