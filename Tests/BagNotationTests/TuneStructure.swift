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
        XCTAssertEqual(doc.tunes.count, 2)
    }

    func testBlankLines() throws {
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
        XCTAssertEqual(doc.tunes.count, 1)
        XCTAssertEqual(doc.tunes[0].lines.count, 4)
    }

    func testTunesWithoutNotes() throws {
        let source = """
            ---
            title: First 
            trad
            style: jig
            ---
            """

        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes.count, 1)
        XCTAssertEqual(doc.tunes[0].lines.count, 0)
    }
}
