//
//  BagfileReader.swift
//  
//
//  Created by Paul Landers on 6/26/23.
//

import Foundation

//class BagfileReader {
//    let contents: String
//    let properties: Properties
//    var errors: [Int] = [] // and warnings, etc. parse() might return opt
//    
//    init(contents: String) {
//        self.contents = contents
//        properties = Properties(tuneNumber: 0, lineOffset: 0, variation: 0, timeSignature: "", noteLength: "", voice: 0, lineNumber: 0, lineNumberInFile: 0, barNumber: 0, barNumberInTune: 0)
//    }
//    
//    func parse() -> Doc {
//        return Doc(tunes: parseTunes(fromDocContents: contents))
//    }
//    
//    private func parseTunes(fromDocContents: any StringProtocol) -> [Tune] {
//        return fromDocContents
//            .split(separator: "\n\n")
//            .map { content in
//                var tuneProps = properties
//                tuneProps.tuneNumber = 1
//                return parseTune(fromContents: content, baseProperties: tuneProps)
//            }
//    }
//    
//    private func parseTune(fromContents: any StringProtocol, baseProperties: Properties) -> Tune {
//        var tuneProps = baseProperties
//        
//        
//        
//        return Tune(lines: parseLines(fromTuneContent: fromContents))
//        
//        
//    }
//    
//    
//    private func parseLines(fromTuneContent: any StringProtocol) -> [Line] {
//        return fromTuneContent
//            .split(separator: "\n")
//            .map { lineContent in
//                Line(bars: parseBars(fromLineContent: lineContent))
//            }
//    }
//    
//    private func parseBars(fromLineContent: any StringProtocol) -> [Bar] {
//        return fromLineContent
//            .split(separator: "|")
//            .map { barContent in
//                Bar(notes: parseNotes(fromBarContent: barContent))
//            }
//    }
//    
//    private func parseNotes(fromBarContent: any StringProtocol) -> [Note] { return [] }
//}
