//
//  Abc.swift
//  Bag Notation
//

import ArgumentParser

struct Abc: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Convert bag notation to abc notation."
    )

    @OptionGroup var options: Bag.Options

    @Option(name: [.short, .customLong("out")], help: "Path for abc output. Prints to stdout if omitted.")
    var ouputFile: String?

    mutating func run() async throws {
        print("TODO: implementation")
    }
}
