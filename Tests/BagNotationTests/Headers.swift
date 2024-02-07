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
             composer: trad
             style: jig
             """

         let header = try makeHeader(from: source)
         XCTAssertEqual(header.title, "First tune")
    }

    func testComposer() throws {
        let source = """
             title: First
             composer: trad
             style: jig
             """

        let header = try makeHeader(from: source)
        XCTAssertEqual(header.composer, "trad")
    }

    func testBylineComposer() throws {
        let source = """
             title: First tune by trad
             style: jig
             """

        let header = try makeHeader(from: source)
        XCTAssertEqual(header.title, "First tune")
        XCTAssertEqual(header.composer, "trad")
    }

    func testTimeSignature() throws {
        let source = """
             title: First
             composer: trad
             style: jig
             time: 4/4
             """

        let header = try makeHeader(from: source)
        XCTAssertEqual(header.timeSignature, .time44)
    }

    func testNoteLength() throws {
        let source = """
             title: First
             composer: trad
             style: jig
             time: 4/4
             note: 1/4
             """
        let header = try makeHeader(from: source)
        XCTAssertEqual(header.noteLength, "1/4")
    }

    func testImpliedTimeSignature() throws {
        let source = """
             title: First
             composer: trad
             style: jig
             """

        let header = try makeHeader(from: source)
        XCTAssertEqual(header.timeSignature, .time68)

//    TODO: test the rest. let knownTypes = [..:..] ; for known: assertEqual
    }

    func testMissingTitle() throws {
        let source = """
             composer: trad
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
             time: 4/4
             """

        XCTAssertThrowsError(try makeHeader(from: source))
    }

    func testMissingTimeSignature() throws {
        let source = """
             title: First
             composer: trad
             style: style_without_inferred_time
             """

        XCTAssertThrowsError(try makeHeader(from: source))
    }
}
