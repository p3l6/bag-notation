//
//  LineStructure.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class LineStructure: XCTestCase {
    func testBarCounts() throws {
        var line = try makeLineVoice(from: "| abc def | abc def | abc def |")
        XCTAssertEqual(line.bars.count, 3)

        line = try makeLineVoice(from: "ef | abc def | abc def |")
        XCTAssertEqual(line.bars.count, 3)
    }

    func testPickupBars() throws {
        var line = try makeLineVoice(from: "| ab cd ef gg | cc dd cc ff | aa bc de f |")
        XCTAssertEqual(line.bars.map(\.isPickup), [false, false, false])

        line = try makeLineVoice(from: "ef | abc def abc def | ff |")
        XCTAssertEqual(line.bars.count, 3)
        XCTAssertEqual(line.bars.map(\.isPickup), [true, false, false])

        line = try makeLineVoice(from: "ef ab cd ad | abc def abc def | ff |")
        XCTAssertEqual(line.bars.count, 3)
        XCTAssertEqual(line.bars.map(\.isPickup), [false, false, false])
    }

    func testBarlineTypes() throws {
        let line = try makeLineVoice(from: "|| abc def |: abc def | abc def :| abc def || abc def ||")
        XCTAssertEqual(line.leadingBarline, .partStart)
        XCTAssertEqual(line.bars.map(\.trailingBarline), [.repeatStart, .plain, .repeatEnd, .double, .partEnd])
    }

    func testClusters() throws {
        let line = try makeLineVoice(from: "| abc def | abcdef | ab cd ef |")
        XCTAssertEqual(line.bars.map(\.contents.count), [2, 1, 3])
    }

    func testMissingTrailingBarline() throws {
        XCTAssertThrowsError(try makeLineVoice(from: "| abc def | abc def | abc def"))
    }
}
