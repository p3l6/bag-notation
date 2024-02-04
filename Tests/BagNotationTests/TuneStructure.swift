//
//  TuneStructure.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class TuneStructure: XCTestCase {
    func testMultipleTunes() throws {
        let doc = try file(from: """
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
            """)

        XCTAssertEqual(doc.tunes.count, 2)
    }

    func testTunesWithoutNotes() throws { XCTFail() }
}
