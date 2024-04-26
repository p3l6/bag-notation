//
//  Formatting.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class FormattingTests: XCTestCase {
    let commonHeader = """
        ---
        title: Scotland the Brave
        trad
        style: 4/4 March
        ---
        """

    func testBarAlignment() throws {
        let source = """
            \(commonHeader)
            ||    xa+ vza.b/ xxcza xxce    | xxh+ th+ vhe xxcza    | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza    | xxb+ xa.b/ ta+ xxce ||
            || xxh+ th+ vhe xxcza | xxh+ th+ vhe xxce | xxh+ th.g/ xf+ h.g/ | xfh tgf xed xcb |
                  xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+. ||
            """
        let formatted = """
            \(commonHeader)
            || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce            ||
            || xxh+ th+ vhe xxcza    | xxh+ th+ vhe xxce  | xxh+ th.g/ xf+ h.g/  | xfh tgf xed xcb                |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        // TODO: Fix offset in final barline

        XCTAssertEqual(try BagFormatter(source).formattedSource(), formatted)
    }

    // TODO: func testLeadingSpaces() throws {}
    // TODO: func testMissingSpaces() throws {}
    // TODO: func testPickups() throws {}
    // TODO: func testLeadingField() throws {}
    // TODO: func testGroups() throws {}
    // TODO: func testNewlines() throws {}
    // TODO: func testFields() throws {}
    // TODO: func testTrailingSpaces() throws {}
}
