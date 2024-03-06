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
        formatSpecs() + doc.tunes.mapToAbc(joined: "\n\n")
    }

    func formatSpecs() -> String {
        """
        %%writefields R
        %%infoname R
        %%titlefont Coronet 32
        %%composerfont Arial 14
        %%equalbars 1
        %%notespacingfactor 1.5
        %%tuplets 2 1 0 1
        %%slurheight 2
        %%rbmax 5
        %%rightmargin 0.8cm
        %%leftmargin 0.8cm
        %%topmargin 0.8cm
        %%bottommargin 0.8cm
        %%maxshrink 1
        %%linewarn 0
        %%linebreak <EOL>
        %%nowrap 1
        %%gracespace 10 6 10
        %%flatbeamgracing 1

        """

        // TODO: Option to enable landscape
        // %% landscape 1
        // TODO: Argument to add date footer (optional param, default now)
        // %% dateformat "%e %b %Y"
        // %% footerfont * 12
        // %% footer "(rev: $D)\t\t"
    }
}


extension Tune: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        var abc = header.abcSource() + "\n"

        var currentGroupMax = 0
        for (line, maxVoiceInGroup) in lines.withMaximumVoiceInGroup() {
            if maxVoiceInGroup != currentGroupMax {
                abc += "%%staves \((0...maxVoiceInGroup).map(String.init).joined(separator: " "))\n"
                currentGroupMax = maxVoiceInGroup
            }
            abc += line.abcSource() + "\n"
        }
        return abc
    }
}

extension Header: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        _ = context.abcSource() // initialize the static comparison context
        
        let tempoLine = if let tempo {
            "Q:\(timeSignature.beatLength.representedNote())=\(tempo)"
        } else {
            "% no tempo"
        }

        return """
        X:1
        T:\(title)
        C:\(composer)
        R:\(style.abcSource())
        M:\(timeSignature.rawValue)
        L:1/8
        \(tempoLine)
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
        var abc = "[V: \(context.voiceNumber)] "
        abc += leadingBarline?.abcSource() ?? ""
        abc += " "
        abc += bars.mapToAbc(joined: " ")
        return abc
    }
}

extension [Line] {
    fileprivate func withMaximumVoiceInGroup() -> some Sequence<(Line, Int)> {
        var maxVoice: Int = 0
        var maxVoices = [Int](repeating: 0, count: count)
        for i in (0..<count).reversed() {
            let lineVoice = self[i].context.voiceNumber
            if maxVoice == 0 { maxVoice = lineVoice }
            maxVoices[i] = maxVoice
            if lineVoice == 0 { maxVoice = 0 }
        }
        return zip(self, maxVoices)
    }
}

extension Bar: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        var abc = noteClusters.map {
            var abc = $0.first?.context.abcSource() ?? ""
            abc += $0.mapToAbc()
            return abc
        }.joined(separator: " ")
        abc += " "
        abc += trailingBarline.abcSource()
        return abc
    }
}

extension Context: AbcSourceConverting {
    private static var previousCheckedContext: Context? = nil

    /// Prints differences since the last time this function was called
    fileprivate func abcSource() -> String {
        var abc = ""
        if variation != Self.previousCheckedContext?.variation {
            abc = if let variation { " [\"\(variation)\" " } else { " ] " }
        }
        if let tempo, tempo != Self.previousCheckedContext?.tempo {
            abc += "[Q:\(timeSignature.beatLength.representedNote())=\(tempo)]"
        }
        Self.previousCheckedContext = self
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
        if tiedToNext {
            abc += "-"
        }
        // TODO: slurs
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

    fileprivate func representedNote() -> String {
        switch self {
        case .sixtyfourth: "1/64"
        case .sixtyfourthDotted: "3/128"
        case .thirtysecond: "1/32"
        case .thirtysecondDotted: "3/64"
        case .sixteenth: "1/16"
        case .sixteenthDotted: "3/32"
        case .eighth: "1/8"
        case .eighthDotted: "3/16"
        case .quarter: "1/4"
        case .quarterDotted: "3/8"
        case .half: "1/2"
        case .halfDotted: "3/4"
        case .whole: "1"
        case .wholeDotted: "3/2"
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
