import XCTest
@testable import Bagfile

final class StringReaderTests: XCTestCase {
    func testPeekAndConsume() throws {
        let reader = StringReader(with: "sample string")
        XCTAssertEqual(reader.peek(), "s")
        XCTAssertEqual(reader.consume(), "s")
        XCTAssertEqual(reader.peek(), "a")
        XCTAssertEqual(reader.consume(), "a")
        XCTAssertEqual(reader.consume(), "m")
        XCTAssertEqual(reader.consume(), "p")
        XCTAssertEqual(reader.peek(), "l")
        XCTAssertEqual(reader.peek(), "l")
    }
    
    func testEndOfString() throws {
        let reader = StringReader(with: "abc")
        XCTAssertEqual(reader.consume(), "a")
        XCTAssertEqual(reader.consume(), "b")
        XCTAssertEqual(reader.consume(), "c")
        XCTAssertNil(reader.peek())
        XCTAssertNil(reader.consume())
    }
    
    func testAhead() throws {
        let reader = StringReader(with: "sample string")
        XCTAssertEqual(reader.peek(ahead: 3), "p")
        XCTAssertEqual(reader.consume(ahead: 2), "m")
        XCTAssertEqual(reader.peek(ahead: 4), "s")
    }
}
