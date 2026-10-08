//
//  Doc.swift
//  Bag Notation
//

public struct Doc {
    public struct Context {
        var identifier: String { "doc" }

        let tuneCount: Int
    }

    let context: Context
    let tunes: [Tune]

    var revision: String? {
        tunes.compactMap(\.header.revision).first
    }
}
