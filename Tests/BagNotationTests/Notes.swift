//
//  Notes.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class Notes: XCTestCase {
    func testPitches() throws {
        let notes = try makeCluster(from: "qrbcdefga")
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
        var notes = try makeCluster(from: "xcpxclxcuxchxc")
        XCTAssertEqual(notes[0].embellishment, .gGracenote)
        XCTAssertEqual(notes[1].embellishment, .dGracenote)
        XCTAssertEqual(notes[2].embellishment, .eGracenote)
        XCTAssertEqual(notes[3].embellishment, .fGracenote)
        XCTAssertEqual(notes[4].embellishment, .highAGracenote)

        notes = try makeCluster(from: "tdltdxtd")
        XCTAssertEqual(notes[0].embellishment, .tap)
        XCTAssertEqual(notes[1].embellishment, .lightTap)
        XCTAssertEqual(notes[2].embellishment, .tapWithGGracenote)

        notes = try makeCluster(from: "xxchxxclxxc")
        XCTAssertEqual(notes[0].embellishment, .doubling)
        XCTAssertEqual(notes[1].embellishment, .doublingWithHighAGracenote)
        XCTAssertEqual(notes[2].embellishment, .halfDoubling)

        notes = try makeCluster(from: "vcpvrvvcxvvchvvc")
        XCTAssertEqual(notes[0].embellishment, .grip)
        XCTAssertEqual(notes[1].embellishment, .rodin)
        XCTAssertEqual(notes[2].embellishment, .odro)
        XCTAssertEqual(notes[3].embellishment, .odroWithGGracenote)
        XCTAssertEqual(notes[4].embellishment, .odroWithHighAGracenote)

        notes = try makeCluster(from: "wrpwrwwepwwe")
        XCTAssertEqual(notes[0].embellishment, .taorluath)
        XCTAssertEqual(notes[1].embellishment, .taorluathFromD)
        XCTAssertEqual(notes[2].embellishment, .crunluath)
        XCTAssertEqual(notes[3].embellishment, .crunluathFromD)

        notes = try makeCluster(from: "zdlzdzzglzzg")
        XCTAssertEqual(notes[0].embellishment, .special)
        XCTAssertEqual(notes[1].embellishment, .lightSpecial)
        XCTAssertEqual(notes[2].embellishment, .wideSpecial)
        XCTAssertEqual(notes[3].embellishment, .lightWideSpecial)

        notes = try makeCluster(from: "kdlkdkkc")
        XCTAssertEqual(notes[0].embellishment, .strike)
        XCTAssertEqual(notes[1].embellishment, .lightStrike)
        XCTAssertEqual(notes[2].embellishment, .pelay)

        notes = try makeCluster(from: "ttrhttrxttrlttrpttr")
        XCTAssertEqual(notes[0].embellishment, .birl)
        XCTAssertEqual(notes[1].embellishment, .birlWithHighAGracenote)
        XCTAssertEqual(notes[2].embellishment, .birlWithHighGGracenote)
        XCTAssertEqual(notes[3].embellishment, .birlWithoutInitialA)
        XCTAssertEqual(notes[4].embellishment, .birlWithDGracenote)

        notes = try makeCluster(from: "nbhnblnbunb")
        XCTAssertEqual(notes[0].embellishment, .cadence)
        XCTAssertEqual(notes[1].embellishment, .cadenceWithHighAGracenote)
        XCTAssertEqual(notes[2].embellishment, .halfCadence)
        XCTAssertEqual(notes[3].embellishment, .halfCadenceWithHighAGracenote)
    }

    func testMismatchedEmbellishments() throws {
        XCTAssertThrowsError(try makeCluster(from: "hxa"))
        XCTAssertThrowsError(try makeCluster(from: "zq"))
        XCTAssertThrowsError(try makeCluster(from: "we"))
        XCTAssertThrowsError(try makeCluster(from: "wwr"))
    }

    func testNoteDuration() throws {
        let notes = try makeCluster(from: "cc+c+.c.d/c++d/.c/c//c+++")
        XCTAssertEqual(notes[0].duration, .eighth)
        XCTAssertEqual(notes[1].duration, .quarter)
        XCTAssertEqual(notes[2].duration, .quarterDotted)
        XCTAssertEqual(notes[3].duration, .eighthDotted)
        XCTAssertEqual(notes[4].duration, .sixteenth)
        XCTAssertEqual(notes[5].duration, .half)
        XCTAssertEqual(notes[6].duration, .sixteenthDotted)
        XCTAssertEqual(notes[7].duration, .sixteenth)
        XCTAssertEqual(notes[8].duration, .thirtysecond)
        XCTAssertEqual(notes[9].duration, .whole)

        // TODO: note is too short
        // TODO: too long?
    }

    func testTies() throws {
        let notes = try makeCluster(from: "c+_cxc_d_e")
        XCTAssertEqual(notes[0].tiedToNext, true)
        XCTAssertEqual(notes[1].tiedToNext, false)
        XCTAssertEqual(notes[2].tiedToNext, true)
        XCTAssertEqual(notes[3].tiedToNext, true)
    }

//    func testTriplets() throws {
//        let notes = try makeCluster(from: "xxexd-e-fg")
//        XCTAssertEqual(notes[0].context.tupletSize, 0)
//        XCTAssertEqual(notes[1].context.tupletSize, 3)
//        XCTAssertEqual(notes[2].context.tupletSize, 3)
//        XCTAssertEqual(notes[3].context.tupletSize, 3)
//        XCTAssertEqual(notes[4].context.tupletSize, 0)
    // TODO: same with quarters. split over a bar? no that's too much. must be within bar, or error.
//    }
}
