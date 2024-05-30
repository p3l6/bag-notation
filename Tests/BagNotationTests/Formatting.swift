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
    let commonTarget = """
        ---
        title: Scotland the Brave
        trad
        style: 4/4 March
        ---
        || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
           xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce           ||
        || xxh+ th+ vhe xxcza    | xxh+ th+ vhe xxce  | xxh+ th.g/ xf+ h.g/  | xfh tgf xed xcb                |
           xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
        """

    func testBarAlignment() throws {
        let source = """
            \(commonHeader)
            || xa+ vza.b/ xxcza xxce    | xxh+ th+ vhe xxcza    | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza    | xxb+ xa.b/ ta+ xxce ||
            || xxh+ th+ vhe xxcza | xxh+ th+ vhe xxce | xxh+ th.g/ xf+ h.g/ | xfh tgf xed xcb |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+. ||
            """
        XCTAssertEqual(try BagFormatter(source).formattedSource(), commonTarget)
    }

    func testRaggedStart() throws {
        let source = """
            \(commonHeader)
            ||    xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
            xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce           ||
            ||xxh+ th+ vhe xxcza    | xxh+ th+ vhe xxce  | xxh+ th.g/ xf+ h.g/  | xfh tgf xed xcb                |
                     xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        XCTAssertEqual(try BagFormatter(source).formattedSource(), commonTarget)
    }

    func testLeadingField() throws {
        let source = """
            \(commonHeader)
            || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
              xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce           ||
            (h) || xxh+ th+ vhe xxcza    | xxh+ th+ vhe xxce  | xxh+ th.g/ xf+ h.g/  | xfh tgf xed xcb                |
            (h)         xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        let formatted = """
            \(commonHeader)
                || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
                   xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce           ||
            (h) || xxh+ th+ vhe xxcza    | xxh+ th+ vhe xxce  | xxh+ th.g/ xf+ h.g/  | xfh tgf xed xcb                |
            (h)    xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        XCTAssertEqual(try BagFormatter(source).formattedSource(), formatted)
        
        let source2 = """
            \(commonHeader)
            || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
            (h)         xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        let formatted2 = """
            \(commonHeader)
             || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
            (h) xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        XCTAssertEqual(try BagFormatter(source2).formattedSource(), formatted2)
    }

    func testPickups() throws {
        let source = """
            \(commonHeader)
            || xfdb | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce           ||
            || xxh+ th+ vhe xxcza    | xxh+ th+ vhe xxce  | xxh+ th.g/ xf+ h.g/  | xfh tgf xed xcb                |
               xf | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            (h) xf | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        let formatted = """
            \(commonHeader)
             || xfdb | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
                       xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce           ||
             ||        xxh+ th+ vhe xxcza    | xxh+ th+ vhe xxce  | xxh+ th.g/ xf+ h.g/  | xfh tgf xed xcb                |
                  xf | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            (h)   xf | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        XCTAssertEqual(try BagFormatter(source).formattedSource(), formatted)

        // TODO: put in this one many of the types of pickups that caused format comments in the previous system
        let source2 = """
            \(commonHeader)
            xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            """
        let formatted2 = """
            \(commonHeader)
            xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            """
        XCTAssertEqual(try BagFormatter(source2).formattedSource(), formatted2)
    }

    // TODO: func testExtraSpacesWithinBar() throws {}
    // TODO: func testMissingSpaces() throws {}
    // TODO: func testTrailingSpaces() throws {}
    // TODO: func testGroups() throws {}
    // TODO: func testNewlines() throws {}
    // TODO: func testFields() throws {}
}
