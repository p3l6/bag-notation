//
//  TuneStructure.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class TuneStructure: XCTestCase {
    func testMultipleTunes() throws {
        let source = """
            ---
            title: First by trad
            style: jig
            ---
            |: abc def :|

            ---
            title: Second by trad
            style: 6/8 March
            ---
            [| abc def |]
            """

        let doc = try file(from: source)
        XCTAssertEqual(doc.tunes.count, 2)
        // TODO: multiple blank lines between tunes
        // TODO: blank lines inside tunes
    }

    func testBlankLines() throws {
        let source = """



            ---
            title: First by trad
            style: jig
            ---


            |: abc def :|
            |: abc def :|


            |: abc def :|
            |: abc def :|
            """

        let doc = try file(from: source)
        XCTAssertEqual(doc.tunes.count, 1)
        XCTAssertEqual(doc.tunes[0].lines.count, 4)

        // TODO: note in readme: Header may not contain blank lines
    }

    func testTunesWithoutNotes() throws {
        let source = """
            ---
            title: First by trad
            style: jig
            ---
            """

        let doc = try file(from: source)
        XCTAssertEqual(doc.tunes.count, 1)
        XCTAssertEqual(doc.tunes[0].lines.count, 0)
    }
}
