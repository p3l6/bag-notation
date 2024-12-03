//
//  Abc.swift
//  Bag Notation
//

import ArgumentParser
import BagNotation

struct Abc: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Convert bag notation to abc notation."
    )

    @OptionGroup var options: Bag.Options

    @Option(name: [.short, .customLong("out")], help: "Path for abc output. Prints to stdout if omitted.")
    var outputFile: String?

    @Flag(name: .shortAndLong, help: "Sets abc formatting to landscape mode.")
    var landscape: Bool = false

    mutating func run() async throws {
        guard let input = try? String(contentsOfFile: options.inputFile) else {
            throw RuntimeError.couldNotRead(file: options.inputFile)
        }

        let doc = try BagReader(input).makeModel()
        let writer = AbcWriter(doc)
        writer.landscape = landscape
        let abc = try writer.makeAbc()

        if let outputFile {
            try abc.write(toFile: outputFile, atomically: true, encoding: .utf8)
        } else {
            print(abc)
        }
    }
}
