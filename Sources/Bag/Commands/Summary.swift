//
//  Summary.swift
//  Bag Notation
//

import ArgumentParser

struct Summary: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: """
            Creates a summary of a group of bag notation files.
            The summary will include the first two bars of each tune, grouped by style and time signature.
            """
    )

    @Argument(help: "Paths of bag notation files.")
    var inputFiles: [String]

    @Option(name: [.short, .customLong("out")], help: "Path for output file. Prints to stdout if omitted.")
    var ouputFile: String?

    mutating func run() async throws {
        print("TODO: implementation")
    }
}
