//
//  Doc.swift
//  Bag Notation
//

public struct Doc {
    public struct Context {
        public var identifier: String { "doc" }

        public let tuneCount: Int
    }

    public let context: Context
    public let tunes: [Tune]

    public var revision: String? {
        tunes.compactMap(\.header.revision).first
    }
}
