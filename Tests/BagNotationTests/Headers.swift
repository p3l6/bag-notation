//
//  Headers.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class Headers: XCTestCase {
    func testTitle() throws {
        let source = """
            title: First tune
            by: trad
            style: jig
            """

        let header = try makeHeader(from: source)
        XCTAssertEqual(header.title, "First tune")
    }

    func testComposer() throws {
        let source = """
            title: First
            by: trad
            style: jig
            """

        let header = try makeHeader(from: source)
        XCTAssertEqual(header.composer, "trad")
    }

    func testTrad() throws {
        let source = """
            title: First tune
            trad
            style: jig
            """

        let header = try makeHeader(from: source)
        XCTAssertEqual(header.title, "First tune")
        XCTAssertEqual(header.composer, "trad")
    }

    func testTimeSignature() throws {
        let source = """
            title: First
            by: trad
            style: jig
            time: 4/4
            """

        let header = try makeHeader(from: source)
        XCTAssertEqual(header.timeSignature, .time44)
    }

    func testNoteLength() throws {
        let source = """
            title: First
            by: trad
            style: jig
            time: 4/4
            note: quarter
            """
        let header = try makeHeader(from: source)
        XCTAssertEqual(header.noteLength, .quarter)
    }

    func testImpliedTimeSignature() throws {
        let source = """
            title: First
            by: trad
            style: jig
            """

        let header = try makeHeader(from: source)
        XCTAssertEqual(header.timeSignature, .time68)

//    TODO: test the rest. let knownTypes = [..:..] ; for known: assertEqual
    }

    func testMissingTitle() throws {
        let source = """
            by: trad
            style: jig
            """

        XCTAssertThrowsError(try makeHeader(from: source))
    }

    func testMissingComposer() throws {
        let source = """
            title: First
            style: jig
            """

        XCTAssertThrowsError(try makeHeader(from: source))
    }

    func testMissingStyle() throws {
        let source = """
            title: First
            by: trad
            time: 4/4
            """

        XCTAssertThrowsError(try makeHeader(from: source))
    }

    func testMissingTimeSignature() throws {
        let source = """
            title: First
            by: trad
            style: style_without_inferred_time
            """

        XCTAssertThrowsError(try makeHeader(from: source))
    }

    func testDuplicateFields() throws {
        XCTAssertThrowsError(try makeHeader(from: """
            title: First
            by: trad
            title: Second
            style: jig
            """))

        XCTAssertThrowsError(try makeHeader(from: """
            style: march
            title: First
            by: trad
            style: jig
            """))
    }

    func testConflictingComposers() throws {
        XCTAssertThrowsError(try makeHeader(from: """
            title: First
            by: someone
            trad
            style: jig
            """))
    }
}
