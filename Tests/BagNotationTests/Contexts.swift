//
//  Contexts.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class Contexts: XCTestCase {
    let source = """
        ---
        title: First by trad
        style: jig
        ---
        |: abc def | (note: 1/4) abc def | abc def  |
           abc def | (time: 4/4) abc def | abc def :|
        [| abc def | abc def | abc def |]

        ---
        title: Second by trad
        style: 6/8 March
        ---
            [| abc def | abc def | abc def |
        (h) [| ecd agb | def abc | def abc |
               abc def | abc def | abc def |]
        (h)    abc def | abc def | abc def |]
            [| abc def | abc def | abc def |
        (h) [| ecd agb | def abc | def abc |
        (h) [| ecd agb | def abc | def abc |
               abc def | abc def | abc def |]
        (h)    abc def | abc def | abc def |]
        (h)    abc def | abc def | abc def |]
        """

    func testTuneNumber() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[0].context.tuneNumber, 1)
        XCTAssertEqual(doc.tunes[1].lines[0].context.tuneNumber, 2)
    }

    func testLineNumber() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[0].context.lineNumberInTune, 1)
        XCTAssertEqual(doc.tunes[0].lines[1].context.lineNumberInTune, 2)
        XCTAssertEqual(doc.tunes[1].lines[0].context.lineNumberInTune, 1)
    }

    func testBarNumber() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[0].bars[0].context.barNumberInLine, 1)
        XCTAssertEqual(doc.tunes[0].lines[0].bars[2].context.barNumberInLine, 3)
        XCTAssertEqual(doc.tunes[0].lines[1].bars[2].context.barNumberInLine, 3)
    }

    func testTimeSignature() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[0].bars[0].notes[0].context.timeSignature, .time68)
        XCTAssertEqual(doc.tunes[0].lines[1].bars[1].notes[0].context.timeSignature, .time44)
        XCTAssertEqual(doc.tunes[0].lines[2].bars[0].notes[0].context.timeSignature, .time44)
        XCTAssertEqual(doc.tunes[1].lines[0].bars[0].notes[0].context.timeSignature, .time68)
    }

    func testNoteLenth() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[0].bars[0].notes[0].context.noteLength, .eighth)
        XCTAssertEqual(doc.tunes[0].lines[0].bars[1].notes[0].context.noteLength, .quarter)
        XCTAssertEqual(doc.tunes[0].lines[1].bars[0].notes[0].context.noteLength, .quarter)
        XCTAssertEqual(doc.tunes[1].lines[0].bars[0].notes[0].context.noteLength, .eighth)
    }

    func testVariation() throws {
        XCTFail()
    }

    func testVoice() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[1].lines[0].context.voiceNumber, 0)
        XCTAssertEqual(doc.tunes[1].lines[1].context.voiceNumber, 1)
        XCTAssertEqual(doc.tunes[1].lines[2].context.voiceNumber, 0)
        XCTAssertEqual(doc.tunes[1].lines[3].context.voiceNumber, 1)
        XCTAssertEqual(doc.tunes[1].lines[6].context.voiceNumber, 2)
    }
}
