//
//  Lexer.swift
//  
//
//  Created by Paul Landers on 7/4/23.
//

import Foundation

struct Token {
    enum TokenType {
        case notes
        case barline
        case field
        case string
        case comment
        case gracenoteLiteral
        case tuneSeparator
        case eof
    }
                
    let type: TokenType
    let content: String
    
    static let EOF = Token(type: .eof, content: "EOF")
}

class Lexer {
    private let reader: any Reader
    private var tokenQueue = [Token]()
    private var isEOF = false
    
    init(reader: any Reader) {
        self.reader = reader
    }
    
    func peek(ahead by: Int = 0) -> Token {
        while !isEOF && tokenQueue.count < by + 1 {
            enqueueNextToken()
        }
        
        guard tokenQueue.count > by else { return Token.EOF }
        return tokenQueue[by]
    }
    
    func consume(ahead by: Int = 0) -> Token {
        let token = peek(ahead: by)
        
        // TODO: Better queue impl. this is O(n)
        tokenQueue.removeFirst(min(by + 1, tokenQueue.count))
        
        return token
        
    }
    
    private func typeOfNextToken() -> Token.TokenType {
        guard let nextChar = reader.peek() else { return .eof }
        switch nextChar {
        case "{": return .field
        case "[", "]", "|", ":": return .barline
        case "\"": return .string
        case "%": return .comment
        case "-": return reader.peek(ahead: 1) == "-" && reader.peek(ahead: 2) == "-" ? .tuneSeparator : .notes
        case "<": return .gracenoteLiteral
        default: return .notes
        }
    }
    
    private func enqueueNextToken() {
        switch typeOfNextToken() {
        case .notes: enqueToken(.notes, allowing: Set("qrbcdefgaxtvwzknphlxu123467890/,.-("))
        case .barline: enqueToken(.barline, allowing: Set("[]|:12346789"))
        case .tuneSeparator: enqueToken(.tuneSeparator, withTerminator: "\n")
        case .comment: enqueToken(.comment, withTerminator: "\n")
        case .field: enqueToken(.field, withTerminator: "}")
        case .gracenoteLiteral: enqueToken(.gracenoteLiteral, withTerminator: ">")
        case .string: enqueToken(.string, withTerminator: "\"")
        case .eof: isEOF = true
        }
    }
    
    private func consumeWhitespace() -> [Character] {
        var characters = [Character]()
        while let peek = reader.peek(), peek.isWhitespace {
            characters.append(reader.consume()!)
        }
        return characters
    }
    
    private func enqueToken(_ type: Token.TokenType, withTerminator terminator: Character) {
        guard reader.peek() != nil else { return }
        var characters = [reader.consume()!]
        
        while let peek = reader.peek(), peek != terminator {
            characters.append(reader.consume()!)
        }
        
        if reader.peek() != nil  {
            // the terminator is part of the current token
            characters.append(reader.consume()!)
        }
        
        characters.append(contentsOf: consumeWhitespace())
        
        tokenQueue.append(Token(type: type, content: String(characters)))
    }
    
    private func enqueToken(_ type: Token.TokenType, allowing validCharacters: Set<Character>) {
        var characters = [Character]()
        
        while let peek = reader.peek(), validCharacters.contains(peek) {
            characters.append(reader.consume()!)
        }
        
        characters.append(contentsOf: consumeWhitespace())
        
        tokenQueue.append(Token(type: type, content: String(characters)))
    }
}
