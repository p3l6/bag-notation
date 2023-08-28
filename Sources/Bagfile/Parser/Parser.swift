//
//  File.swift
//  
//
//  Created by Paul Landers on 7/4/23.
//

import Foundation

struct ParseTree {
    struct Node {
        enum NodeType {
            case file
            case tune
            case line
            case bar
            
            // TODO: either group by line or extract newlines as a separate node.
            
            case noteGroup
            case note
            case noteEmbellishment
            case noteValue
            case noteLength
            
            case barline
            
            case field
            case fieldBoundary
            case fieldPair
            case fieldName
            case fieldColon
            case fieldValue
            case fieldPairSeparator
            
            case string
            case stringBoundary
            case stringContent
            
            case comment
            case commentBoundary
            case commentContent
            
            case gracenoteLiteral
            case gracenoteLiteralBoundary
            case gracenoteLiteralContent
            
            case tuneSeparator
        }
        
        let type: NodeType
        let children: [Node]
        let content: String
        
        init(type: NodeType, content: String) {
            self.type = type
            self.children = []
            self.content = content
        }
        
        init(type: NodeType, children: [Node]) {
            self.type = type
            self.children = children
            self.content = "<container>"
        }
    }
    
    let rootNote: Node
}

class Parser {
    let lexer: Lexer
    
    init(lexer: Lexer) {
        self.lexer = lexer
    }
    
    func parse() -> ParseTree {
        return ParseTree(rootNote: parseFile())
    }
    
    private func parseFile() -> ParseTree.Node {
        var children = [ParseTree.Node]()
        while !lexer.isEOF {
            children.append(parseTuneUntilSeparator())
            if lexer.peek().type == .tuneSeparator {
                let token = lexer.consume()
                children.append(.init(type: .tuneSeparator, content: token.content))
            }
        }
        return .init(type: .file, children: children)
    }
    
    private func parseTuneUntilSeparator() -> ParseTree.Node {
        var children = [ParseTree.Node]()
        
    loop: while !lexer.isEOF {
            switch lexer.peek().type {
            case .tuneSeparator: break loop
            case .barline:
                // TODO: how to group on bars?
                // keep a currentBar variable, append note patterns to it.
                let token = lexer.consume()
                children.append(.init(type: .barline, content: token.content))
            case .comment: children.append(parseComment())
            case .field: children.append(parseField())
            case .gracenoteLiteral: children.append(parseGracenoteLiteral())
            case .string: children.append(parseString())
            case .notes: children.append(parseNoteGroup())
            case .eof: break
            }
        }
        
        return .init(type: .tune, children: children)
    }
    
    private func parseComment() -> ParseTree.Node {
        let token = lexer.consume()
        var comment = token.content
        
        return .init(type: .comment, children: [
            .init(type: .commentBoundary, content: String(comment.removeFirst())),
            .init(type: .commentContent, content: comment)
        ])
    }
    
    private func parseString() -> ParseTree.Node {
        let token = lexer.consume()
        let inner = extract(from: token.content, between: "\"", and: "\"")
        
        return .init(type: .string, children: [
            .init(type: .stringBoundary, content: "\""),
            .init(type: .stringContent, content: inner),
            .init(type: .stringBoundary, content: "\"")
        ])
    }
    
    private func parseGracenoteLiteral() -> ParseTree.Node {
        let token = lexer.consume()
        let inner = extract(from: token.content, between: "<", and: ">")
        // TODO: do we need these literals? could define in a field { grace: fede }
        // either way, in bag letters, not abc.
        // rename to not literals, but custom-embellishment
        // maybe define in advance, like U =, and then use?par
        return .init(type: .gracenoteLiteral, children: [
            .init(type: .gracenoteLiteralBoundary, content: "<"),
            .init(type: .gracenoteLiteralContent, content: inner),
            .init(type: .gracenoteLiteralBoundary, content: ">")
        ])
    }

    private func parseField() -> ParseTree.Node {
        let token = lexer.consume()
        let inner = extract(from: token.content, between: "{", and: "}")
        
        var children = [ParseTree.Node]()
        children.append(.init(type: .fieldBoundary, content: "{"))
                        
        let pairs = inner.split(separator: ";", omittingEmptySubsequences: false)
        children.append(fieldPairNode(String(pairs.first ?? "")))
        for pair in pairs[1...] {
            children.append(.init(type: .fieldPairSeparator, content: ";"))
            children.append(fieldPairNode(String(pair)))
        }
        
        children.append(contentsOf: [.init(type: .fieldBoundary, content: "}")])

        return .init(type: .field, children: children)
    }
    
    private func parseNoteGroup() -> ParseTree.Node {
        let token = lexer.consume()
        var children = [ParseTree.Node]()
        var currentNote = ""
        var hasNote = false
        
        // TODO: abc triplet note prefix. rework into length? between gracenotes or a separate token? or {triplet}
        
        let lengthChars = Set("123467890/,.-(")
        let embellishChars = Set("xtvwzknphlxu")
        let scaleChars = Set("qrbcdefga")
        
        for char in token.content {
            if char.isWhitespace {
                children.append(noteNode(currentNote))
                break
            } else if hasNote && !lengthChars.contains(char) {
                children.append(noteNode(currentNote))
                hasNote = false
                currentNote = ""
            } else if scaleChars.contains(char) {
                currentNote.append(char)
                hasNote = true
            } else {
                currentNote.append(char)
            }
        }
        
        return .init(type: .noteGroup, children: children)
    }
    
    
}

fileprivate func extract(from content: String, between start: Character, and end: Character) -> String {
    let startIndex = content.firstIndex(of: start)
    let endIndex = content.lastIndex(of: end)
    guard let startIndex, let endIndex,
        startIndex != endIndex else { return "" }
    let beginIndex = content.index(after: startIndex)
    return String(content[beginIndex..<endIndex]).trimmingCharacters(in: .whitespaces)
}

fileprivate func fieldPairNode(_ content: String) -> ParseTree.Node {
    let parts = content.split(separator: ":").map(String.init)
    
    if parts.count == 1 {
        return .init(type: .fieldValue, content: parts[0].trimmingCharacters(in: .whitespaces))
    }
    
    return .init(type: .fieldPair, children: [
        .init(type: .fieldName, content: parts[0].trimmingCharacters(in: .whitespaces)),
        .init(type: .fieldColon, content: ":"),
        .init(type: .fieldValue, content: parts[1].trimmingCharacters(in: .whitespaces)),
    ])
}

fileprivate func noteNode(_ content: String) -> ParseTree.Node {
    // TODO: Define these sets, reuse here and lexer
    let noteIndex = content.firstIndex(where: { !Set("xtvwzknphlxu").contains($0) })
    var children = [ParseTree.Node]()
    if let noteIndex {
        if noteIndex != content.startIndex {
            children.append(.init(type: .noteEmbellishment, content: String(content.prefix(upTo: noteIndex))))
        }
        children.append(.init(type: .noteValue, content: String(content[noteIndex])))
        if content.index(after: noteIndex) != content.endIndex {
            children.append(.init(type: .noteLength, content: String(content.suffix(from: noteIndex))))
        }
    }
    
    return .init(type: .note, children: children)
}
