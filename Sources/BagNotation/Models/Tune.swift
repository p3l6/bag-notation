//
//  Tune.swift
//  Bag Notation
//

public struct Tune {
    public struct Context {
        var identifier: String { "t\(tuneNumber)" }

        /// First tune is 1
        let tuneNumber: Int
        let lineCount: Int
    }

    let context: Context
    let header: Header
    let lines: [Line]
}
