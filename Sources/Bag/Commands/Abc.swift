//
//  Abc.swift
//  Bag Notation
//

import ArgumentParser
import BagNotation

struct Abc: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Convert bag notation to abc notation."
    )

    @OptionGroup var inOpts: Bag.InputOptions
    @OptionGroup var outOpts: Bag.OutputOptions

    @Option(name: [.short, .customLong("out")], help: "Path for abc output. If ommitted, path is determined automatically by replacing file extension.")
    var outputFile: String?

    @Flag(name: .shortAndLong, help: "Prints abc to stdout instead of a file.")
    var printed: Bool = false

    mutating func run() async throws {
        guard let input = try? String(contentsOfFile: inOpts.inputFile) else {
            throw RuntimeError.couldNotRead(file: inOpts.inputFile)
        }

        let abc = try Self.abc(for: input, with: outOpts)

        if printed {
            print(abc)
        } else  {
            let outputFile = outputFile ?? inOpts.inputFile.replacingExtension("bag", with: "abc")
            try abc.write(toFile: outputFile, atomically: true, encoding: .utf8)
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
