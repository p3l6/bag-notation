//
//  Format.swift
//  Bag Notation
//

import ArgumentParser
import BagNotation
import SwiftTreeSitter

struct Format: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Format a bag notation file."
    )

    @OptionGroup var options: Bag.Options

    @Flag(name: .shortAndLong, help: "Overwrite the input file with the formatted output. Otherwise prints to stdout.")
    var inPlace: Bool = false

    mutating func run() async throws {
        guard let input = try? String(contentsOfFile: options.inputFile) else {
            throw RuntimeError.couldNotRead(file: options.inputFile)
        }

        let output = try BagFormatter(input).formattedSource()

        if inPlace {
            print("TODO: implementation")
        } else {
            print(output)
        }
    }
}
