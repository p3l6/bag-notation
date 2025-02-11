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

    @OptionGroup var inOpts: Bag.InputOptions
    @OptionGroup var outOpts: Bag.OutputOptions

    @Option(name: [.short, .customLong("out")], help: "Path for abc output. Prints to stdout if omitted.")
    var outputFile: String?

    mutating func run() async throws {
        guard let input = try? String(contentsOfFile: inOpts.inputFile) else {
            throw RuntimeError.couldNotRead(file: inOpts.inputFile)
        }

        let abc = try Self.abc(for: input, with: outOpts)

        if let outputFile {
            try abc.write(toFile: outputFile, atomically: true, encoding: .utf8)
        } else {
            print(abc)
        }
    }

    static func abc(for inputFileContents: String, with outOpts: Bag.OutputOptions) throws -> String {
        var doc = try BagReader(inputFileContents).makeModel()
        if outOpts.melodyOnly { doc = doc.withSingleVoice() }
        let writer = AbcWriter(doc)
        writer.landscape = outOpts.landscape
        return try writer.makeAbc()
    }
}
