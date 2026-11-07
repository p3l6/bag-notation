//
//  Tune.swift
//  Bag Notation
//

public struct Tune {
    public struct Context {
        public var identifier: String { "t\(tuneNumber)" }
        public let style: TuneStyle
        public let sourceRange: SourceRange

        /// First tune is 1
        public let tuneNumber: Int
        public let lineCount: Int
    }

    public let context: Context
    public let header: Header
    public let lines: [Line]
}
