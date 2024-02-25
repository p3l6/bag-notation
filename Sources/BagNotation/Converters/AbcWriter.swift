//
//  AbcWriter.swift
//  Bag Notation
//

import os

private let logger = Logger(subsystem: "bag", category: "AbcWriter")

public class AbcWriter {
    let doc: Doc
    var abc = ""

    public init(_ doc: Doc) { self.doc = doc }

    public func makeAbc() throws -> String {
        doc.tunes.mapToAbc(joined: "\n\n")
    }
}

extension Tune: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        header.abcSource() + "\n" + lines.mapToAbc(joined: "\n")
    }
}

extension Header: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        """
        X:1
        T:\(title)
        C:\(composer)
        R:\(style.abcSource())
        M:\(timeSignature.rawValue)
        L:1/8
        K:HP
        """
    }
}

extension TuneStyle: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        switch self {
        case .march, .march24, .march34, .march44, .march54, .march68, .march98, .march128:
            "March"
        case .hornpipe: "Hornpipe"
        case .jig, .jig98, .jig128: "Jig"
        case .reel: "Reel"
        case .strathspey: "Strathspey"
        case .slowAir: "Slow Air"
        case .slowMarch: "Slow March"
        case .piob: "Piobaireachd"
        }
    }
}

extension Line: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        var abc = leadingBarline?.abcSource() ?? ""
        abc += " "
        abc += bars.mapToAbc(joined: " ")
        return abc
    }
}

extension Bar: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        var abc = noteClusters.map { $0.mapToAbc() }.joined(separator: " ")
        abc += " "
        abc += trailingBarline.abcSource()
        return abc
    }
}

extension Barline: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        switch self {
        case .plain: "|"
        case .partStart: "[|"
        case .partEnd: "|]"
        case .repeatStart: "|:"
        case .repeatEnd: ":|"
        case .double: "||"
        }
    }
}
extension Note: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        var abc = ""
        if let embellishment, let gracenotes = try? pitch.gracenotes(for: embellishment) {
            abc += "{\(gracenotes.mapToAbc())}"
        }
        abc += pitch.abcSource()
        abc += duration.abcSource()
        return abc
    }
}

extension Pitch: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        switch self {
        case .highA: "a"
        case .highG: "g"
        case .f: "f"
        case .e: "e"
        case .d: "d"
        case .c: "c"
        case .b: "B"
        case .lowA: "A"
        case .lowG: "G"
        }
    }
}

extension Duration: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        switch self {
        case .sixtyfourth: "///"
        case .sixtyfourthDotted: "3/16"
        case .thirtysecond: "//"
        case .thirtysecondDotted: "3/8"
        case .sixteenth: "/"
        case .sixteenthDotted: "3/4"
        case .eighth: "" // The constant base note length
        case .eighthDotted: "3/2"
        case .quarter: "2"
        case .quarterDotted: "3"
        case .half: "4"
        case .halfDotted: "6"
        case .whole: "8"
        case .wholeDotted: "12"
        }
    }
}

private protocol AbcSourceConverting {
    func abcSource() -> String
}

private extension Array where Element: AbcSourceConverting {
    func mapToAbc(joined: String = "") -> String {
        map { $0.abcSource() }.joined(separator: joined)
    }
}
