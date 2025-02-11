//
//  SingleVoice.swift
//  Bag Notation
//

public extension Doc {
    /// Creates a new Doc with only the melody parts for each line
    func withSingleVoice() -> Doc {
        Doc(context: context, tunes: tunes.map { $0.withSingleVoice() })
    }
}

extension Tune {
    func withSingleVoice() -> Tune {
        Tune(context: context, header: header, lines: lines.map { $0.withSingleVoice() })
    }
}

extension Line {
    func withSingleVoice() -> Line {
        let melody: [Voice] = if let v = voices.first { [v] } else { [] }
        return Line(context: context, voices: melody)
    }
}
