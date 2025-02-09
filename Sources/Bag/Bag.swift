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
        subcommands: [Abc.self, Format.self, Pdf.self])

    struct Options: ParsableArguments {
        @Argument(help: "Path of a bag notation file.")
        var inputFile: String
    }
}

enum RuntimeError: Error, LocalizedError {
    case couldNotRead(file: String)
    case executableNotFound(name: String)
    case executableFailed(name: String, output: String)

    var errorDescription: String? {
        switch self {
        case let .couldNotRead(file): "Could not read file: \(file)"
        case let .executableNotFound(name): "Could not find required program: \(name)"
        case let .executableFailed(name, output): "'\(name)' failed with: \(output)"
        }
    }
}
