//
//  Context.swift
//  Bag Notation
//

import Foundation

struct Context {
    var tuneNumber: Int = 0 // first tune is 1
//    var voiceNumber: Int = 0
    var lineNumberInTune: Int = 0 // first line is 1
    var barNumberInLine: Int = 0 // first bar is 1
    
//    var variation: Int

    var timeSignature: String = "4/4"
    var noteLength: String = "1/8"

//    var filePosition: (line: Int, col: Int, length: Int)
}
