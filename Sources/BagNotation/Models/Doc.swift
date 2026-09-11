//
//  Doc.swift
//  Bag Notation
//

public struct Doc {
    let context: DocContext
    let tunes: [Tune]

    var revision: String? {
        tunes.compactMap(\.header.revision).first
    }
}
