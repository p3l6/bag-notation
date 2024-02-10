//
//  Bag.swift
//  Bag Notation
//

import ArgumentParser

@main
struct Bag: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A parser for bag notation files.",
        subcommands: [Abc.self, Format.self, Check.self, Summary.self])

    struct Options: ParsableArguments {
        @Argument(help: "Path of a bag notation file.")
        var inputFile: String
    }
}
