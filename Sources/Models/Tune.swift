//
//  Tune.swift
//  
//
//  Created by Paul Landers on 6/25/23.
//

import Foundation

struct Tune {
    let title: String
    let style: String
    let composer: String
    let noteLength: String // enum ?
    let timeSignature: String? // enum ?
    let tags: [String]
    let number: Int
    let lineOffset: Int // for error mapping. keep?
    let lines: [Line]
    // headers.
    // "verbatim" tokens
}
