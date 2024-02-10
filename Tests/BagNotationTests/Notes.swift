//
//  Notes.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class Notes: XCTestCase {
    func testPitches() throws {
        let notes = try makeNoteCluster(from: "qrbcdefga")
        XCTAssertEqual(notes[0].pitch, .lowG)
        XCTAssertEqual(notes[1].pitch, .lowA)
        XCTAssertEqual(notes[2].pitch, .b)
        XCTAssertEqual(notes[3].pitch, .c)
        XCTAssertEqual(notes[4].pitch, .d)
        XCTAssertEqual(notes[5].pitch, .e)
        XCTAssertEqual(notes[6].pitch, .f)
        XCTAssertEqual(notes[7].pitch, .highG)
        XCTAssertEqual(notes[8].pitch, .highA)
    }

    func testEmbellishments() throws {
        var notes = try makeNoteCluster(from: "xcpxclxcuxchxc")
        XCTAssertEqual(notes[0].embellishment, .gGracenote)
        XCTAssertEqual(notes[1].embellishment, .dGracenote)
        XCTAssertEqual(notes[2].embellishment, .eGracenote)
        XCTAssertEqual(notes[3].embellishment, .fGracenote)
        XCTAssertEqual(notes[4].embellishment, .highAGracenote)

        notes = try makeNoteCluster(from: "tdltdxtd")
        XCTAssertEqual(notes[0].embellishment, .tap)
        XCTAssertEqual(notes[1].embellishment, .lightTap)
        XCTAssertEqual(notes[2].embellishment, .tapWithGGracenote)

        notes = try makeNoteCluster(from: "xxchxxclxxc")
        XCTAssertEqual(notes[0].embellishment, .doubling)
        XCTAssertEqual(notes[1].embellishment, .doublingWithHighAGracenote)
        XCTAssertEqual(notes[2].embellishment, .halfDoubling)

        notes = try makeNoteCluster(from: "vcpvrvvcxvvchvvc")
        XCTAssertEqual(notes[0].embellishment, .grip)
        XCTAssertEqual(notes[1].embellishment, .rodin)
        XCTAssertEqual(notes[2].embellishment, .odro)
        XCTAssertEqual(notes[3].embellishment, .odroWithGGracenote)
        XCTAssertEqual(notes[4].embellishment, .odroWithHighAGracenote)

        notes = try makeNoteCluster(from: "wrpwrwwepwwe")
        XCTAssertEqual(notes[0].embellishment, .taorluath)
        XCTAssertEqual(notes[1].embellishment, .taorluathFromD)
        XCTAssertEqual(notes[2].embellishment, .crunluath)
        XCTAssertEqual(notes[3].embellishment, .crunluathFromD)

        notes = try makeNoteCluster(from: "zdlzdzzglzzg")
        XCTAssertEqual(notes[0].embellishment, .special)
        XCTAssertEqual(notes[1].embellishment, .lightSpecial)
        XCTAssertEqual(notes[2].embellishment, .wideSpecial)
        XCTAssertEqual(notes[3].embellishment, .lightWideSpecial)

        notes = try makeNoteCluster(from: "kdlkdkkc")
        XCTAssertEqual(notes[0].embellishment, .strike)
        XCTAssertEqual(notes[1].embellishment, .lightStrike)
        XCTAssertEqual(notes[2].embellishment, .pelay)

        notes = try makeNoteCluster(from: "ttrhttrxttrlttrpttr")
        XCTAssertEqual(notes[0].embellishment, .birl)
        XCTAssertEqual(notes[1].embellishment, .birlWithHighAGracenote)
        XCTAssertEqual(notes[2].embellishment, .birlWithHighGGracenote)
        XCTAssertEqual(notes[3].embellishment, .birlWithoutInitialA)
        XCTAssertEqual(notes[4].embellishment, .birlWithDGracenote)

        notes = try makeNoteCluster(from: "nbhnblnbunb")
        XCTAssertEqual(notes[0].embellishment, .cadence)
        XCTAssertEqual(notes[1].embellishment, .cadenceWithHighAGracenote)
        XCTAssertEqual(notes[2].embellishment, .halfCadence)
        XCTAssertEqual(notes[3].embellishment, .halfCadenceWithHighAGracenote)
    }

    func testMismatchedEmbellishments() throws {
        XCTAssertThrowsError(try makeNoteCluster(from: "hxa"))
        XCTAssertThrowsError(try makeNoteCluster(from: "zq"))
        XCTAssertThrowsError(try makeNoteCluster(from: "we"))
        XCTAssertThrowsError(try makeNoteCluster(from: "wwr"))
    }

    func testNoteDuration() throws {
        let e = Duration.eighth.value
        let x = Duration.sixteenth.value
        let notes = try makeNoteCluster(from: "cc2c3c.dc,dc/c//c3/2")
        XCTAssertEqual(notes[0].duration, Duration(value: e)) // c
        XCTAssertEqual(notes[1].duration, Duration(value: e * 2)) // c2
        XCTAssertEqual(notes[2].duration, Duration(value: e * 3)) // c3
        XCTAssertEqual(notes[3].duration, Duration(value: e + x)) // c.
        XCTAssertEqual(notes[4].duration, Duration(value: x)) // .d
        XCTAssertEqual(notes[5].duration, Duration(value: x)) // c,
        XCTAssertEqual(notes[6].duration, Duration(value: e + x)) // ,d
        XCTAssertEqual(notes[7].duration, Duration(value: x)) // c/
        XCTAssertEqual(notes[8].duration, Duration(value: x / 2)) // c//
        XCTAssertEqual(notes[9].duration, Duration(value: e * 3 / 2)) // c3/2

        // TODO: note is too short
        // TODO: too long?
    }

    func testTies() throws {
        // TODO: re-evaluate. as a property? "tiedToNext"?
//        let notes = try makeNoteCluster(from: "c2-")
//        XCTAssertEqual(notes[0].duration, "2-")
    }

    func testRests() throws { XCTFail() }

    func testAccidentals() throws { XCTFail() }
}
