//
//  LineStructure.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class LineStructure: XCTestCase {
    func testBarCounts() throws {
        var line = try makeLine(from: "| abc def | abc def | abc def |")
        XCTAssertEqual(line.bars.count, 3)

        line = try makeLine(from: "ef | abc def | abc def |")
        XCTAssertEqual(line.bars.count, 3)
    }

    func testPickupBars() throws { XCTFail() }
    
    func testBarlineTypes() throws {
        var line = try makeLine(from: "[| abc def |: abc def | abc def :| abc def || abc def |]")
//TODO:         XCTAssertEqual(line.leadingBarline, "[|")
        XCTAssertEqual(line.bars[0].trailingBarline, "|:")
        XCTAssertEqual(line.bars[1].trailingBarline, "|")
        XCTAssertEqual(line.bars[2].trailingBarline, ":|")
        XCTAssertEqual(line.bars[3].trailingBarline, "||")
        XCTAssertEqual(line.bars[4].trailingBarline, "|]")
    }

    func testNoteClusters() throws { XCTFail() }
    func testInlineField() throws { XCTFail() }
    func testLeadingInlineField() throws { XCTFail() }
    func testAnnotations() throws { XCTFail() }
    func testVoices() throws { XCTFail() }
    func testVariations() throws { XCTFail() }

    func testMissingTrailingBarline() throws {
        XCTAssertThrowsError(try makeLine(from: "| abc def | abc def | abc def"))
    }
}
