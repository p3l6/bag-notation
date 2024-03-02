//
//  Bag.swift
//  Bag Notation
//

import ArgumentParser
import Foundation

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

enum RuntimeError: Error, LocalizedError {
    case couldNotRead(file: String)

    var errorDescription: String? {
        switch self {
        case .couldNotRead(let file): "Could not read file: \(file)"
        }
    }
}
