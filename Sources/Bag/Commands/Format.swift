//
//  Format.swift
//  Bag Notation
//

import ArgumentParser

struct Format: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Format a bag notation file."
    )

    @OptionGroup var options: Bag.Options

    @Flag(name: .shortAndLong, help: "Overwrite the input file with the formatted output. Otherwise prints to stdout.")
    var inPlace: Bool = false

    mutating func run() async throws {
        print("TODO: implementation")
    }
}
