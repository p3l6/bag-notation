//
//  Notes.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class Notes: XCTestCase {
    func testPitches() throws {
        let notes = try makeCluster(from: "labcdefgh")
        XCTAssertEqual(notes.map(\.pitch), [.lowG, .lowA, .b, .c, .d, .e, .f, .highG, .highA])

        let gracenotes = try makeCluster(from: "qojkpzuymd")
        XCTAssertEqual(gracenotes[0].embellishment?.pitches, [.lowG, .lowA, .b, .c, .d, .e, .f, .highG, .highA])
    }

    func testEmbellishments() throws {
        var notes = try makeCluster(from: "xcpczcucgxc")
        XCTAssertEqual(notes.map(\.embellishment?.pitches), [[.highG], [.d], [.e], [.f], nil, [.highA]])

        notes = try makeCluster(from: "tdsdykd")
        XCTAssertEqual(notes.map(\.embellishment?.pitches), [[.lowG], [.c], [.highG, .c]])

        notes = try makeCluster(from: "xxcgxxcanxc")
        XCTAssertEqual(notes.map(\.embellishment?.pitches), [[.highG, .c, .d], nil, [.highA, .c, .d], nil, [.c, .d]])

        notes = try makeCluster(from: "vcdvanvcxvcgxvc")
        XCTAssertEqual(notes.map(\.embellishment?.pitches), [[.lowG, .d, .lowG], nil, [.lowG, .b, .lowG], [.c, .lowG, .d, .lowG], [.highG, .c, .lowG, .d, .lowG], nil, [.highA, .c, .lowG, .d, .lowG]])

        notes = try makeCluster(from: "vzadvzavrevzue")
        XCTAssertEqual(notes.map(\.embellishment?.pitches), [[.lowG, .d, .lowG, .e], nil, [.lowG, .b, .lowG, .e], [.lowG, .d, .lowG, .e, .lowA, .f, .lowA], [.lowG, .d, .lowG, .e, .lowA, .f, .lowA]])

        notes = try makeCluster(from: "rdlrdrerfrg")
        XCTAssertEqual(notes.map(\.embellishment?.pitches), [[.lowG, .d, .c], nil, [.d, .c], [.e, .lowA, .f, .lowA], [.f, .e, .highG, .e], [.f, .e, .highG, .e, .f, .e]])

        notes = try makeCluster(from: "xtdxsdxxtd")
        XCTAssertEqual(notes.map(\.embellishment?.pitches), [[.highG, .d, .lowG], [.highG, .d, .c], [.highG, .d, .e, .d, .lowG]])

        notes = try makeCluster(from: "ttanttaxttagxtta")
        XCTAssertEqual(notes.map(\.embellishment?.pitches), [[.lowG, .lowA, .lowG], [.lowA, .lowG, .lowA, .lowG], [.highG, .lowA, .lowG, .lowA, .lowG], nil, [.highA, .lowA, .lowG, .lowA, .lowG]])
    }

    func testMismatchedEmbellishments() throws {
        XCTAssertThrowsError(try makeCluster(from: "xh"))
        XCTAssertThrowsError(try makeCluster(from: "rl"))
        XCTAssertThrowsError(try makeCluster(from: "vze"))
        XCTAssertThrowsError(try makeCluster(from: "zra"))
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
        XCTAssertEqual(notes.map(\.context.body.tupletSize), [0, 3, 3, 3, 0])
        XCTAssertEqual(notes.map(\.context.body.tupletNumber), [0, 1, 2, 3, 0])

        notes = try makeCluster(from: "xd-e-fxe-d-c")
        XCTAssertEqual(notes.map(\.context.body.tupletSize), [3, 3, 3, 3, 3, 3])
        XCTAssertEqual(notes.map(\.context.body.tupletNumber), [1, 2, 3, 1, 2, 3])
    }

    func testTuplets() throws {
        var notes = try makeCluster(from: "a-b-c-d-e-fgbd")
        XCTAssertEqual(notes.map(\.context.body.tupletSize), [6, 6, 6, 6, 6, 6, 0, 0, 0])
        XCTAssertEqual(notes.map(\.context.body.tupletNumber), [1, 2, 3, 4, 5, 6, 0, 0, 0])

        notes = try makeCluster(from: "a+-b+-c+-d+")
        XCTAssertEqual(notes.map(\.context.body.tupletSize), [4, 4, 4, 4])
        XCTAssertEqual(notes.map(\.context.body.tupletNumber), [1, 2, 3, 4])
    }
}
