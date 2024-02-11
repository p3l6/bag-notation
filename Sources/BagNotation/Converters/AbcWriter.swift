//
//  AbcWriter.swift
//  Bag Notation
//

import os

private let logger = Logger(subsystem: "bag", category: "AbcWriter")

public class AbcWriter {
    let doc: Doc
    public init(_ doc: Doc) { self.doc = doc }

    public func makeAbc() throws -> String {
        "TODO: insert abc output here"
    }
}
