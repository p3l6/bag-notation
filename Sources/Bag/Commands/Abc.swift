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

    mutating func run() async throws {
        guard let input = try? String(contentsOfFile: options.inputFile) else {
            throw RuntimeError.couldNotRead(file: options.inputFile)
        }

        // TODO: change names of these. BagReader().makeDoc()  AbcWriter()
        let doc = try ModelBuilder(input).makeModel()
        let abc = try AbcWriter(doc).makeAbc()

        if let outputFile {
            try abc.write(toFile: outputFile, atomically: true, encoding: .utf8)
        } else {
            print(abc)
        }
    }
}
