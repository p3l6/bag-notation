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
        XCTAssertEqual(line.bars[0].isPickup, false)
        XCTAssertEqual(line.bars[1].isPickup, false)
        XCTAssertEqual(line.bars[2].isPickup, false)

        line = try makeLineVoice(from: "ef | abc def abc def | ff |")
        XCTAssertEqual(line.bars.count, 3)
        XCTAssertEqual(line.bars[0].isPickup, true)
        XCTAssertEqual(line.bars[1].isPickup, false)
        XCTAssertEqual(line.bars[2].isPickup, false)

        line = try makeLineVoice(from: "ef ab cd ad | abc def abc def | ff |")
        XCTAssertEqual(line.bars.count, 3)
        XCTAssertEqual(line.bars[0].isPickup, false)
        XCTAssertEqual(line.bars[1].isPickup, false)
        XCTAssertEqual(line.bars[2].isPickup, false)
    }

    func testBarlineTypes() throws {
        let line = try makeLineVoice(from: "|| abc def |: abc def | abc def :| abc def || abc def ||")
        XCTAssertEqual(line.leadingBarline, .partStart)
        XCTAssertEqual(line.bars[0].trailingBarline, .repeatStart)
        XCTAssertEqual(line.bars[1].trailingBarline, .plain)
        XCTAssertEqual(line.bars[2].trailingBarline, .repeatEnd)
        XCTAssertEqual(line.bars[3].trailingBarline, .double)
        XCTAssertEqual(line.bars[4].trailingBarline, .partEnd)
    }

    func testClusters() throws {
        let line = try makeLineVoice(from: "| abc def | abcdef | ab cd ef |")
        XCTAssertEqual(line.bars[0].clusters.count, 2)
        XCTAssertEqual(line.bars[1].clusters.count, 1)
        XCTAssertEqual(line.bars[2].clusters.count, 3)
    }

    func testMissingTrailingBarline() throws {
        XCTAssertThrowsError(try makeLineVoice(from: "| abc def | abc def | abc def"))
    }
}
