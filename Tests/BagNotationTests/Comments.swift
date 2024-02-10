//
//  Comments.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class Comments: XCTestCase {
    func testLeadingComments() throws {
        let source = """
            % top of file comment
            % another comment
            ---
            title: First by trad
            style: jig
            ---
            |: abc def :|

            % end of file comment
            """

        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes.count, 1)
        XCTAssertEqual(doc.tunes[0].lines.count, 1)
    }

    func testBodyComments() throws {
        let source = """
            ---
            title: First by trad
            style: jig
            ---
            |: abc def :|
            % body comment
            |: abc def :|

            """

        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes.count, 1)
        XCTAssertEqual(doc.tunes[0].lines.count, 2)
    }

    func testTrailingLineComments() throws {
        let source = """
            ---
            title: First by trad
            style: jig
            ---
            |: abc def :|  % trailing comment
            |: abc def :|

            """

        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes.count, 1)
        XCTAssertEqual(doc.tunes[0].lines.count, 2)
    }

    func testCommentsBetweenTunes() throws {
        let source = """
            ---
            title: First by trad
            style: jig
            ---
            |: abc def :|
            |: abc def :|

            % between comment

            % another
            % comment


            ---
            title: Second by trad
            style: jig
            ---
            |: abc def :|

            """

        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes.count, 2)
        XCTAssertEqual(doc.tunes[0].lines.count, 2)
    }
}
