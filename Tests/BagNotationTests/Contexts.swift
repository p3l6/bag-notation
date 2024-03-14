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
        |: abc def | (note: quarter) abc def | abc def  |
           abc def | (time: 4/4) abc def | abc def :|
        || abc def | abc (v: 1) abc (v: 2) def (v) abc | abc def ||

        ---
        title: Second by trad
        style: 6/8 March
        ---
            || abc def | abc def | abc def |
        (h) || ecd agb | def abc | def abc |
               abc def | abc def | abc def ||
        (h)    abc def | abc def | abc def ||
            || abc def | abc def | abc def |
        (h) || ecd agb | def abc | def abc |
        (h) || ecd agb | def abc | def abc |
               abc def | abc def | abc def ||
        (h)    abc def | abc def | abc def ||
        (h)    abc def | abc def | abc def ||
        """

    func testTuneNumber() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].context.body.tuneNumber, 1)
        XCTAssertEqual(doc.tunes[1].context.body.tuneNumber, 2)
    }

    func testLineNumber() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[0].context.body.lineNumber, 1)
        XCTAssertEqual(doc.tunes[0].lines[1].context.body.lineNumber, 2)
        XCTAssertEqual(doc.tunes[1].lines[0].context.body.lineNumber, 1)
    }

    func testBarNumber() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[0].voices[0].bars[0].context.body.barNumber, 1)
        XCTAssertEqual(doc.tunes[0].lines[0].voices[0].bars[2].context.body.barNumber, 3)
        XCTAssertEqual(doc.tunes[0].lines[1].voices[0].bars[2].context.body.barNumber, 3)
    }

    func testTimeSignature() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[0].voices[0].bars[0].notes[0].context.head.timeSignature, .time68)
        XCTAssertEqual(doc.tunes[0].lines[1].voices[0].bars[1].notes[0].context.head.timeSignature, .time44)
        XCTAssertEqual(doc.tunes[0].lines[2].voices[0].bars[0].notes[0].context.head.timeSignature, .time44)
        XCTAssertEqual(doc.tunes[1].lines[0].voices[0].bars[0].notes[0].context.head.timeSignature, .time68)
    }

    func testNoteLenth() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[0].voices[0].bars[0].notes[0].context.head.noteLength, .eighth)
        XCTAssertEqual(doc.tunes[0].lines[0].voices[0].bars[1].notes[0].context.head.noteLength, .quarter)
        XCTAssertEqual(doc.tunes[0].lines[1].voices[0].bars[0].notes[0].context.head.noteLength, .quarter)
        XCTAssertEqual(doc.tunes[1].lines[0].voices[0].bars[0].notes[0].context.head.noteLength, .eighth)
    }

    func testVariation() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[0].lines[2].voices[0].bars[1].notes[0].context.head.variation, nil)
        XCTAssertEqual(doc.tunes[0].lines[2].voices[0].bars[1].notes[3].context.head.variation, "1")
        XCTAssertEqual(doc.tunes[0].lines[2].voices[0].bars[1].notes[6].context.head.variation, "2")
        XCTAssertEqual(doc.tunes[0].lines[2].voices[0].bars[1].notes[9].context.head.variation, nil)
    }

    func testVoice() throws {
        let doc = try makeFile(from: source)
        XCTAssertEqual(doc.tunes[1].lines[0].voices.count, 2)
        XCTAssertEqual(doc.tunes[1].lines[0].voices[0].context.body.voiceNumber, 0)
        XCTAssertEqual(doc.tunes[1].lines[0].voices[1].context.body.voiceNumber, 1)
        XCTAssertEqual(doc.tunes[1].lines[1].voices.count, 2)
        XCTAssertEqual(doc.tunes[1].lines[1].voices[0].context.body.voiceNumber, 0)
        XCTAssertEqual(doc.tunes[1].lines[1].voices[1].context.body.voiceNumber, 1)
        XCTAssertEqual(doc.tunes[1].lines[2].voices.count, 3)
        XCTAssertEqual(doc.tunes[1].lines[3].voices.count, 3)
    }
}
