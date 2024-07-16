//
//  Formatting.swift
//  Bag Notation
//

@testable import BagNotation
import Testing

struct FormattingTests {
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

    @Test
    func barAlignment() throws {
        let source = """
            \(commonHeader)
            || xa+ vza.b/ xxcza xxce    | xxh+ th+ vhe xxcza    | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza    | xxb+ xa.b/ ta+ xxce ||
            || xxh+ th+ vhe xxcza | xxh+ th+ vhe xxce | xxh+ th.g/ xf+ h.g/ | xfh tgf xed xcb |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+. ||
            """
        #expect(try BagFormatter(source).formattedSource() == commonTarget)
    }

    @Test
    func raggedStart() throws {
        let source = """
            \(commonHeader)
            ||    xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
            xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce           ||
            ||xxh+ th+ vhe xxcza    | xxh+ th+ vhe xxce  | xxh+ th.g/ xf+ h.g/  | xfh tgf xed xcb                |
                     xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        #expect(try BagFormatter(source).formattedSource() == commonTarget)
    }

    @Test
    func leadingField() throws {
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
        #expect(try BagFormatter(source).formattedSource() == formatted)

        let source2 = """
            \(commonHeader)
            || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
            (h)         xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            &         xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        let formatted2 = """
            \(commonHeader)
             || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
            (h) xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            &   xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+.               ||
            """
        #expect(try BagFormatter(source2).formattedSource() == formatted2)
    }

    @Test
    func pickups() throws {
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
        #expect(try BagFormatter(source).formattedSource() == formatted)

        let source2 = """
            \(commonHeader)
            xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            xrpxce | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            xr-b-c  | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            xe+++ | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            nxf+. xxe+. | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            c++ xd++ | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            """
        let formatted2 = """
            \(commonHeader)
                     xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            xrpxce | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            xr-b-c | xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
                     xe+++                 | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
                     nxf+. xxe+.           | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
                     c++ xd++              | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||
            """
        #expect(try BagFormatter(source2).formattedSource() == formatted2)
    }

    @Test
    func extraAndMissingSpaces() throws {
        let source = """
            \(commonHeader)
            || xa+ vza.b/ xxcza xxce    | xxh+ th+ vhe xxcza    | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza    | xxb+ xa.b/ ta+ xxce ||
            ||xxh+ th+ vhe xxcza | xxh+    th+ vhe xxce | xxh+ th.g/ xf+ h.g/ | xfh tgf xed xcb |
               xa+    vza.b/ xxcza xxce |xxh+ th+ vhe xxcza | rd+    xf.d/ xxce xxcza | xxb+ xa.b/ ta+. ||
            """
        #expect(try BagFormatter(source).formattedSource() == commonTarget)
        // TODO: Fix case where nodes cannot parse adjacent to a following barline, ie `xxce|`
    }

    @Test
    func groups() throws {
        let source = """
            \(commonHeader)
            || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
            xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce ||

            || xxh+ th+ vhe xxcza | xxh+ th+ vhe | xxh+ th.g/ xf+ h.g/ | xfh tgf xed xcb |
            xa+ vza.b/ xxcza | xxh+ th+ vhe          | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+. ||
            """
        let formatted = """
            \(commonHeader)
            || xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xxe+ te.f/ xe/.d//xc/.b// |
               xa+ vza.b/ xxcza xxce | xxh+ th+ vhe xxcza | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+ xxce           ||

            || xxh+ th+ vhe xxcza | xxh+ th+ vhe | xxh+ th.g/ xf+ h.g/  | xfh tgf xed xcb  |
               xa+ vza.b/ xxcza   | xxh+ th+ vhe | rd+ xf.d/ xxce xxcza | xxb+ xa.b/ ta+. ||
            """
        #expect(try BagFormatter(source).formattedSource() == formatted)
    }

    // TODO: func testTrailingSpaces() throws {}
    // TODO: func testNewlines() throws {}
    // TODO: func testFields() throws {}
}
