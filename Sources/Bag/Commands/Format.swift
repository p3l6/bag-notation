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

    @OptionGroup var options: Bag.InputOptions

    @Flag(help: "Does not print or wirte, but will exit with error if input is not already well formatted.")
    var dryRun: Bool = false

    @Flag(name: .shortAndLong, help: "Overwrite the input file with the formatted output. Otherwise prints to stdout.")
    var inPlace: Bool = false

    mutating func run() async throws {
        guard let input = try? String(contentsOfFile: options.inputFile) else {
            throw RuntimeError.couldNotRead(file: options.inputFile)
        }

        let formatter = BagFormatter(input)
        if dryRun {
            let modifications = try formatter.modifiedRanges()
            guard modifications.isEmpty else {
                throw ExitCode(1)
            }
            return
        }

        let output = try formatter.formattedSource()

        if inPlace {
            try output.write(toFile: options.inputFile, atomically: true, encoding: .utf8)
        } else {
            print(output)
        }
    }
}
