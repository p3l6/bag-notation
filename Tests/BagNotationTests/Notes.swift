//
//  Notes.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class Notes: XCTestCase {
    func testPitches() throws {
        let notes = try makeCluster(from: "qrbcdefga")
        XCTAssertEqual(notes.map(\.pitch), [.lowG, .lowA, .b, .c, .d, .e, .f, .highG, .highA])
    }

    func testEmbellishments() throws {
        var notes = try makeCluster(from: "xcpxclxcuxchxc")
        XCTAssertEqual(notes.map(\.embellishment), [.gGracenote, .dGracenote, .eGracenote, .fGracenote, .highAGracenote])

        notes = try makeCluster(from: "tdltdxtd")
        XCTAssertEqual(notes.map(\.embellishment), [.tap, .lightTap, .tapWithGGracenote])

        notes = try makeCluster(from: "xxchxxclxxc")
        XCTAssertEqual(notes.map(\.embellishment), [.doubling, .doublingWithHighAGracenote, .halfDoubling])

        notes = try makeCluster(from: "vcpvrvvcxvvchvvc")
        XCTAssertEqual(notes.map(\.embellishment), [.grip, .rodin, .odro, .odroWithGGracenote, .odroWithHighAGracenote])

        notes = try makeCluster(from: "wrpwrwwepwwe")
        XCTAssertEqual(notes.map(\.embellishment), [.taorluath, .taorluathFromD, .crunluath, .crunluathFromD])

        notes = try makeCluster(from: "zdlzdzzglzzg")
        XCTAssertEqual(notes.map(\.embellishment), [.special, .lightSpecial, .wideSpecial, .lightWideSpecial])

        notes = try makeCluster(from: "kdlkdkkc")
        XCTAssertEqual(notes.map(\.embellishment), [.strike, .lightStrike, .pelay])

        notes = try makeCluster(from: "ttrhttrxttrlttrpttr")
        XCTAssertEqual(notes.map(\.embellishment), [.birl, .birlWithHighAGracenote, .birlWithHighGGracenote, .birlWithoutInitialA, .birlWithDGracenote])

        notes = try makeCluster(from: "nbhnblnbunb")
        XCTAssertEqual(notes.map(\.embellishment), [.cadence, .cadenceWithHighAGracenote, .halfCadence, .halfCadenceWithHighAGracenote])
    }

    func testMismatchedEmbellishments() throws {
        XCTAssertThrowsError(try makeCluster(from: "hxa"))
        XCTAssertThrowsError(try makeCluster(from: "zq"))
        XCTAssertThrowsError(try makeCluster(from: "we"))
        XCTAssertThrowsError(try makeCluster(from: "wwr"))
    }

    func testNoteDuration() throws {
        let notes = try makeCluster(from: "cc+c+.c.d/c++d/.c/c//c+++")
        XCTAssertEqual(notes.map(\.duration), [.eighth, .quarter, .quarterDotted, .eighthDotted, .sixteenth, .half, .sixteenthDotted, .sixteenth, .thirtysecond, .whole])

        // TODO: note is too short
        // TODO: too long?
    }

    func testTies() throws {
        let notes = try makeCluster(from: "c+_cxc_d_e")
        XCTAssertEqual(notes.map(\.tiedToNext), [true, false, true, true, false])
    }

    func testTriplets() throws {
        var notes = try makeCluster(from: "xxexd-e-fg")
        XCTAssertEqual(notes.map(\.context.body.tupletSize), [0,3,3,3,0])
        XCTAssertEqual(notes.map(\.context.body.tupletNumber), [0,1,2,3,0])

        notes = try makeCluster(from: "xd-e-fxe-d-c")
        XCTAssertEqual(notes.map(\.context.body.tupletSize), [3,3,3,3,3,3])
        XCTAssertEqual(notes.map(\.context.body.tupletNumber), [1,2,3,1,2,3])
    }

    func testTuplets() throws {
        var notes = try makeCluster(from: "a-b-c-d-e-fgbd")
        XCTAssertEqual(notes.map(\.context.body.tupletSize), [6,6,6,6,6,6,0,0,0])
        XCTAssertEqual(notes.map(\.context.body.tupletNumber), [1,2,3,4,5,6,0,0,0])
        
        notes = try makeCluster(from: "a+-b+-c+-d+")
        XCTAssertEqual(notes.map(\.context.body.tupletSize), [4, 4, 4 ,4])
        XCTAssertEqual(notes.map(\.context.body.tupletNumber), [1,2,3,4,])
    }
}
