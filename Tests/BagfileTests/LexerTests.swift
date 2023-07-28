import XCTest
@testable import Bagfile

final class LexerTests: XCTestCase {
    func testInfo() {
        let lex = Lexer(reader: StringReader(with: """
            { title: Scotland the Brave; composer: Trad; }
            { rhythm: March; meter: 4/4; note: 1/8 }
            { tags: something }
            [| xr2 wr.b {M:6/8} xxclxr xxce |
            """))
        XCTAssertEqual(lex.consume(), Token(type: .field, content: "{ title: Scotland the Brave; composer: Trad; }\n"))
        XCTAssertEqual(lex.consume(), Token(type: .field, content: "{ rhythm: March; meter: 4/4; note: 1/8 }\n"))
        XCTAssertEqual(lex.consume(), Token(type: .field, content: "{ tags: something }\n"))
        XCTAssertEqual(lex.consume(), Token(type: .barline, content: "[| "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "xr2 "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "wr.b "))
        XCTAssertEqual(lex.consume(), Token(type: .field, content: "{M:6/8} "))
    }
    
    func testEof() {
        let lex = Lexer(reader: StringReader(with: "xxclxr\n"))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "xxclxr\n"))
        XCTAssertEqual(lex.consume(), Token.EOF)
    }
    
    func testEmpty() {
        let lex = Lexer(reader: StringReader(with: ""))
        XCTAssertEqual(lex.consume(), Token.EOF)
    }
    
    func testString() {
        let lex = Lexer(reader: StringReader(with: "[\"2 of 2\" xr.b vc2"))
        XCTAssertEqual(lex.consume(), Token(type: .barline, content: "["))
        XCTAssertEqual(lex.consume(), Token(type: .string, content: "\"2 of 2\" "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "xr.b "))
    }
    
    func testComment() {
        let lex = Lexer(reader: StringReader(with: """
            { title: Scotland the Brave; composer: Trad; }
            { rhythm: March; meter: 4/4; note: 1/8 }
            % this is a comment
            [| xr2 wr.b {M:6/8} xxclxr xxce |

            % this is another comment
            xxa2 ta2 vae xxclxr | zd
            """))
        _ = lex.consume()
        _ = lex.consume()
        XCTAssertEqual(lex.consume(), Token(type: .comment, content: "% this is a comment\n"))
        XCTAssertEqual(lex.consume(ahead: 7), Token(type: .comment, content: "% this is another comment\n"))
        
    }
    
    func testTuneSeparator() {
        let lex = Lexer(reader: StringReader(with: """
            { title: Scotland the Brave; composer: Trad; }
            { rhythm: March; meter: 4/4; note: 1/8 }

            ---

            { title: Rowan Tree; composer: Trad; }
            { rhythm: March; meter: 4/4; note: 1/8 }
            """))
        _ = lex.consume()
        _ = lex.consume()
        XCTAssertEqual(lex.consume(), Token(type: .tuneSeparator, content: "---\n\n"))
        
    }
    
    func testBarline() {
        let lex = Lexer(reader: StringReader(with: """
            [| xr2 wr.b xxclxr xxce | xxa2 ta2 vae [1 xxclxr ] :|
            ["2 of 2" zd2 xf.d || xxce xxclxr |]
            """))
        XCTAssertEqual(lex.consume(), Token(type: .barline, content: "[| "))
        XCTAssertEqual(lex.consume(ahead: 4), Token(type: .barline, content: "| "))
        XCTAssertEqual(lex.consume(ahead: 3), Token(type: .barline, content: "[1 "))
        _ = lex.consume()
        XCTAssertEqual(lex.consume(), Token(type: .barline, content: "] "))
        XCTAssertEqual(lex.consume(), Token(type: .barline, content: ":|\n"))
        XCTAssertEqual(lex.consume(), Token(type: .barline, content: "["))
        XCTAssertEqual(lex.consume(ahead: 3), Token(type: .barline, content: "|| "))
        XCTAssertEqual(lex.consume(ahead: 2), Token(type: .barline, content: "|]"))
        
    }
    
    func testNotes() {
        let lex = Lexer(reader: StringReader(with: """
            xe/.d/xc/.b/ xebtb- xe,g | [2 d/] g//f//-fxd/ hx(3fed x(3c2b2tr2 e3/2
            """))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "xe/.d/xc/.b/ "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "xebtb- "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "xe,g "))
        XCTAssertEqual(lex.consume(), Token(type: .barline, content: "| "))
        XCTAssertEqual(lex.consume(), Token(type: .barline, content: "[2 "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "d/"))
        XCTAssertEqual(lex.consume(), Token(type: .barline, content: "] "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "g//f//-fxd/ "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "hx(3fed "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "x(3c2b2tr2 "))
        XCTAssertEqual(lex.consume(), Token(type: .notes, content: "e3/2"))
        
    }
    
    func testAhead() {
        let lex = Lexer(reader: StringReader(with: """
            { title: Scotland the Brave; composer: Trad; }
            { rhythm: March; meter: 4/4; note: 1/8 }
            [| xr2 wr.b xxclxr xxce | xxa2 ta2 vae xxclxr | zd2 xf.d xxce xxclxr | xxb2 xxe2 te.f xe/.d/xc/.b/ |
               xr2 wr.b xxclxr xxce | xxa2 ta2 vae xxclxr | zd2 xf.d xxce xxclxr | xxb2 xr.b tr2 xxce          |]
            [| xxa2 ta2 vae xxclxr  | xxa2 ta2 vae xxce   | xxa2 ta.g hxf2 a.g   | hxfa tgf xed xcb            |
               xr2 wr.b xxclxr xxce | xxa2 ta2 vae xxclxr | zd2 xf.d xxce xxclxr | xxb2 xr.b tr3               |]
            """))
        XCTAssertEqual(lex.peek(ahead: 3), Token(type: .notes, content: "xr2 "))
        XCTAssertEqual(lex.consume(ahead: 11), Token(type: .notes, content: "xxclxr "))
        XCTAssertEqual(lex.peek(ahead: 3), Token(type: .notes, content: "xxce "))
    }
    
}

extension Token: Equatable {
    public static func == (lhs: Token, rhs: Token) -> Bool {
        lhs.type == rhs.type && lhs.content == rhs.content
    }
}
