import XCTest
@testable import Bagfile

final class ParserTests: XCTestCase {
    func rootNode(forString string: String) -> ParseTree.Node {
        return Parser(lexer: Lexer(reader: StringReader(with:string)))
            .parse()
            .rootNote
    }
    
    func testBasicParse() {
        let lex = Lexer(reader: StringReader(with: """
            { title: Scotland the Brave; composer: Trad }
            { rhythm: March; meter: 4/4; note: 1/8 }
            { tags: something }
            [| xr2 wr.b {M:6/8} xxclxr xxce |
            """))
        let root = Parser(lexer: lex).parse().rootNote
        XCTAssertEqual(root.type, .file)
        XCTAssertEqual(root.children.count, 1)
        XCTAssertEqual(root.children.first!.type, .tune)
        XCTAssertEqual(root.children.first!.children.count, 10)
        XCTAssertEqual(root.children.first!.children[2].type, .field)
        XCTAssertEqual(root.children.first!.children[3].content, "[| ")
    }
    
    func testComment() {
        let root = rootNode(forString: """
            % some comment
            % another comment
            """)
        let tune = root.children.first!
        XCTAssertEqual(tune.children.count, 2)
        XCTAssertEqual(tune.children.first!.type, .comment)
        XCTAssertEqual(tune.children.first!.children[0].type, .commentBoundary)
        XCTAssertEqual(tune.children.first!.children[1].type, .commentContent)
        XCTAssertEqual(tune.children.first!.children[1].content, " some comment\n")
    }
    
    func testString() {
        let root = rootNode(forString: """
            ["2 of 2" xr4
            """)
        let tune = root.children.first!
        XCTAssertEqual(tune.children.count, 3)
        XCTAssertEqual(tune.children[1].type, .string)
        XCTAssertEqual(tune.children[1].children[0].type, .stringBoundary)
        XCTAssertEqual(tune.children[1].children[1].type, .stringContent)
        XCTAssertEqual(tune.children[1].children[1].content, "2 of 2")
    }
    
    func testMultipleTunes() {
        let root = rootNode(forString: """
            | xr2 wr.b xxclxr xxce |
            
            ---
            
            { title: Scotland the Brave; composer: Trad }
            """)
        XCTAssertEqual(root.children.count, 3)
        XCTAssertEqual(root.children[0].type, .tune)
        XCTAssertEqual(root.children[1].type, .tuneSeparator)
        XCTAssertEqual(root.children[2].type, .tune)
    }
    
    func testGracenoteLiterals() {
        let root = rootNode(forString: "xr2 wr.b <efg>clxr")
        let tune = root.children.first!
        XCTAssertEqual(tune.children.count, 4)
        XCTAssertEqual(tune.children[2].type, .gracenoteLiteral)
        XCTAssertEqual(tune.children[2].children[0].type, .gracenoteLiteralBoundary)
        XCTAssertEqual(tune.children[2].children[1].type, .gracenoteLiteralContent)
        XCTAssertEqual(tune.children[2].children[1].content, "efg")
        XCTAssertEqual(tune.children[2].children[2].type, .gracenoteLiteralBoundary)
    }
    
    func testFields() {
        let root = rootNode(forString: "{ title: Scotland the Brave; composer: Trad }")
        let field = root.children.first!.children.first!
        XCTAssertEqual(field.type, .field)
        XCTAssertEqual(field.children.count, 5)
        XCTAssertEqual(field.children[1].type, .fieldPair)
        XCTAssertEqual(field.children[1].children[0].content, "title")
        XCTAssertEqual(field.children[1].children[1].type, .fieldColon)
        XCTAssertEqual(field.children[1].children[2].content, "Scotland the Brave")
        XCTAssertEqual(field.children[2].type, .fieldPairSeparator)
    }
    
    func testInlineField() {
        let root = rootNode(forString: "xr2 wr.b {M:6/8} xxclxr xxce")
        let field = root.children.first!.children[2]
        XCTAssertEqual(field.type, .field)
        XCTAssertEqual(field.children.count, 3)
        XCTAssertEqual(field.children[1].type, .fieldPair)
        XCTAssertEqual(field.children[1].children[0].content, "M")
        XCTAssertEqual(field.children[1].children[1].type, .fieldColon)
        XCTAssertEqual(field.children[1].children[2].content, "6/8")
    }
    
    func testUnnamedField() {
        let root = rootNode(forString: "xr2 wr.b { triplet } xxclxr xxce")
        let field = root.children.first!.children[2]
        XCTAssertEqual(field.type, .field)
        XCTAssertEqual(field.children.count, 3)
        XCTAssertEqual(field.children[1].type, .fieldValue)
        XCTAssertEqual(field.children[1].content, "triplet")
    }
    
    func testNoteGroup() {}
    
    func testLineAndBarGrouping() {}
 
}
