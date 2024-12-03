//
//  AbcWriter.swift
//  Bag Notation
//

public class AbcWriter {
    let doc: Doc
    var abc = ""
    public var landscape = false

    public init(_ doc: Doc) { self.doc = doc }

    public func makeAbc() throws -> String {
        formatSpecs() + doc.tunes.mapToAbc(joined: "\n\n")
    }

    func formatSpecs() -> String {
        let revision = doc.tunes.compactMap { $0.header.revision }.first
        let revisionLines = if let revision {
            "%% footerfont * 12\n%% footer \"(rev: \(revision))\t\t\"" }
        else {
            "% no rev"
        }

        return """
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
        %% landscape \(landscape ? 1 : 0)
        \(revisionLines)

        """
    }
}

private var activeFlow: FlowContext!

extension Tune: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        activeFlow = context.head

        var abc = header.abcSource() + "\n"
        abc += lines.mapToAbc(joined: "\n")
        return abc
    }
}

extension Header: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        let tempoLine = if let tempo {
            "Q:\(timeSignature.beatLength.representedNote())=\(tempo)"
        } else {
            "% no tempo"
        }
        let arranger = if let arranger { ", arr. \(arranger)" } else { "" }

        let pageBreak = if forceNewPage { "%%newpage" } else { "% no forced page break" }

        return """
            \(pageBreak)
            X:1
            T:\(title)
            C:\(composer)\(arranger)
            R:\(style.abcSource())
            M:\(timeSignature.abcSource())
            L:1/8
            \(tempoLine)
            K:HP
            """
    }
}

extension TuneStyle: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        switch self {
        case .march: "March"
        case .hornpipe: "Hornpipe"
        case .jig: "Jig"
        case .reel: "Reel"
        case .strathspey: "Strathspey"
        case .slowAir: "Slow Air"
        case .slowMarch: "Slow March"
        case .piob: "Piobaireachd"
        case .waulk: "Waulking Song"
        case .waltz: "Waltz"
        case .hymn: "Hymn"
        }
    }
}

extension TimeSignature: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        switch self {
        case .time22: "2/2"
        case .time24: "2/4"
        case .time32: "3/2"
        case .time34: "3/4"
        case .time44: "4/4"
        case .time54: "5/4"
        case .time64: "6/4"
        case .time68: "6/8"
        case .time98: "9/8"
        case .time128: "12/8"
        }
    }
}

extension Line: AbcSourceConverting {
    static var currentVoiceCount = 0

    fileprivate func abcSource() -> String {
        var abc = ""
        if voices.count != Self.currentVoiceCount {
            abc += "%%staves \((0 ..< voices.count).map(String.init).joined(separator: " "))\n"
            Self.currentVoiceCount = voices.count
        }
        abc += voices.mapToAbc(joined: "\n")
        return abc
    }
}

extension Voice: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        var abc = "[V: \(context.body.voiceNumber)] "
        abc += leadingBarline?.abcSource() ?? ""
        abc += " "
        abc += bars.mapToAbc(joined: " ")
        // ends a possible variation here
        activeFlow = context.tail
        return abc
    }
}

extension Bar: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        var abc = contents.map { element in
            switch element {
            case .cluster(let cluster): cluster.context.head.abcSource() + cluster.abcSource()
            case .rest(let duration): "z" + duration.abcSource()
            case .barRest: "Z"
            case .spacer(let duration): "x" + duration.abcSource()
            case .barSpacer: "X"
            }
        }.joined(separator: " ")
        abc += " "
        abc += trailingBarline.abcSource()
        return abc
    }
}

extension FlowContext: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        var abc = ""
        if variation != activeFlow.variation {
            switch variation {
            case .none: abc += " ] "
            case let .other(label): abc += " [\"\(label)\" "
            }
        }
        if let tempo, tempo != activeFlow.tempo {
            abc += "[Q:\(timeSignature.beatLength.representedNote())=\(tempo)]"
        }
        if timeSignature != activeFlow.timeSignature {
            abc += "[M:\(timeSignature.abcSource())]"
        }
        activeFlow = self
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

extension Cluster: AbcSourceConverting {
    fileprivate func abcSource() -> String {
        notes.mapToAbc()
    }
}

extension Note: AbcSourceConverting {
    static var closeNextSlur = false

    fileprivate func abcSource() -> String {
        var abc = ""
        if let annotation {
            abc += " \"^\(annotation)\" "
        }

        if slurredToNext {
            abc += "("
        }

        if context.body.tupletNumber == 1 {
            abc += "(\(context.body.tupletSize)"
        }

        if let embellishment {
            abc += "{\(embellishment.pitches.mapToAbc())}"
        }

        if fermata {
            abc += "H"
        }

        if let accidental {
            let abcAccidental = switch accidental {
            case .sharp: "^"
            case .flat: "_"
            case .natural: "="
            }
            abc += abcAccidental
        }

        if let chord {
            abc += "[\(pitch.abcSource())\(chord.abcSource())]"
        } else {
            abc += pitch.abcSource()
        }

        abc += duration.abcSource()
        
        if tiedToNext {
            abc += "-"
        }
        if Self.closeNextSlur {
            abc += ")"
            Self.closeNextSlur = false
        }
        if slurredToNext {
            Self.closeNextSlur = true
        }

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
