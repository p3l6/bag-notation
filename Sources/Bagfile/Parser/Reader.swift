//
//  Reader.swift
//  
//
//  Created by Paul Landers on 7/4/23.
//

import Foundation

protocol Reader {
    func peek() -> Character?
    func peek(ahead by: Int) -> Character?
    func consume() -> Character?
    func consume(ahead by: Int) -> Character?
}

class StringReader: Reader {
    let contents: String
    var next: String.Index
    
    init(with contents: String) {
        self.contents = contents
        self.next = contents.startIndex
    }
    
    func peek() -> Character? {
        guard next < contents.endIndex else { return nil }
        return contents[next]
    }
    
    func peek(ahead by: Int) -> Character? {
        let index = contents.index(next, offsetBy: by)
        guard index < contents.endIndex else { return nil }
        return contents[index] 
    }
    
    func consume() -> Character? {
        guard next < contents.endIndex else { return nil }
        let consumed = contents[next]
        next = contents.index(after: next)
        return consumed
    }
    
    func consume(ahead by: Int) -> Character? {
        let index = contents.index(next, offsetBy: by)
        guard index < contents.endIndex else { return nil }
        let consumed = contents[index]
        next = contents.index(after: index)
        return consumed
    }
}

// TODO: FileReader, just load it all and delegate to StringReader
