//
//  FileStructure.swift
//  Bag Notation
//

@testable import BagNotation
import XCTest

final class FileStructure: XCTestCase {
//    override func setUpWithError() throws {}
//    override func tearDownWithError() throws {}

    func testSampleTune() throws {
        let source = """
            ---
            title: Graemsay by Magnus Leask
            style: jig
            ---
            |: xr2pxr xbrq | xr2b zd2e  | xfata faf | xefe xedb |
               xr2pxr xbrq | xr2b zd2e  | xfaf xedb | zd3 kd2b :|
            |: xrbd xb2tr  | xrbd xb2tr | xfata faf | xefe xedb |
               xrbd xb2tr  | xrbd xb2tr | xfaf xedb | zd3 kd3  :|
            """
        let tree = makeTree(source: source)
        let doc = makeModel(from: tree)

        XCTAssertEqual(doc.tunes.count, 1)
    }

    // TODO: Can we make a tree from a fragment? and not have to have extra layers?
}
