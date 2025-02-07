//
//  Pdf.swift
//  Bag Notation
//

import ArgumentParser
import BagNotation
import Foundation

struct Pdf: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Render bag notation to pdf."
    )

    @OptionGroup var inOpts: Bag.InputOptions
    @OptionGroup var outOpts: Bag.OutputOptions

    @Option(name: [.short, .customLong("out")], help: "Path for pdf output.")
    var outputFile: String

    lazy var tempDir = URL.temporaryDirectory.appending(component: "bag-notation").appending(component: UUID().uuidString)
    lazy var abcFile = tempDir.appendingPathComponent("conv.abc")
    lazy var psFile = tempDir.appendingPathComponent("conv.ps")

    mutating func run() async throws {
        guard let input = try? String(contentsOfFile: inOpts.inputFile) else {
            throw RuntimeError.couldNotRead(file: inOpts.inputFile)
        }

        guard let abcm2ps = findTool(named: "abcm2ps") else {
            print("Could not find abcm2ps, which is required to render pdfs.")
            print("Hint: install it with `brew install p3l6/tap/abcm2ps`")
            throw RuntimeError.executableNotFound(name: "abcm2ps")
        }

        guard let ps2pdf = findTool(named: "ps2pdf") else {
            print("Could not find ps2pdf, which is required to render pdfs.")
            print("Hint: install it with `brew install ghostscript`")
            throw RuntimeError.executableNotFound(name: "ps2pdf")
        }

        let abc = try Abc.abc(for: input, with: outOpts)

        try FileManager.default.createDirectory(at: tempDir, withIntermediateDirectories: true, attributes: nil)
        try abc.write(toFile: abcFile.path, atomically: true, encoding: .utf8)

        try subProccess(abcm2ps, with: ["-p", abcFile.path, "-O", psFile.path])
        try subProccess(ps2pdf, with: [psFile.path, outputFile])

        print("Converted \(inOpts.inputFile) to a pdf at \(outputFile)")
    }

    private func subProccess(_ url: URL, with args: [String]) throws {
        let task = Process()
        let output = Pipe()
        let errors = Pipe()
        task.executableURL = url
        task.arguments = args
        task.standardOutput = output
        task.standardError = errors
        try task.run()
        task.waitUntilExit()
        guard task.terminationStatus == 0 else {
            let outputData = output.fileHandleForReading.readDataToEndOfFile()
            let errorsData = errors.fileHandleForReading.readDataToEndOfFile()
            let outputString = String(data: outputData, encoding: .utf8)
            let errorsString = String(data: errorsData, encoding: .utf8)
            throw RuntimeError.executableFailed(name: url.lastPathComponent, output: [outputString, errorsString].compactMap{$0}.joined(separator: "\n"))
        }
    }

    private func findTool(named: String) -> URL? {
        // Look in path
        let task = Process()
        let output = Pipe()
        task.executableURL = URL(filePath: "/usr/bin/type")
        task.arguments = ["-p", named]
        task.standardOutput = output

        do {
            try task.run()
            task.waitUntilExit()
            let outputData = output.fileHandleForReading.readDataToEndOfFile()
            if let resultInformation = String(data: outputData, encoding: .utf8),
               !resultInformation.isEmpty, task.terminationStatus == 0,
               let firstLine = resultInformation.split(separator: "\n").first {
                return URL(filePath: String(firstLine))
            }
        } catch {
            // Ignore error, and continue to next check
        }

        // check common homebrew prefixes, in case homebrew path is not configured
        let homebrewPrefixes: [String] = [
            "/opt/homebrew/bin",
            "/usr/local/bin",
            "/home/linuxbrew/.linuxbrew/bin"
        ]
        for prefix in homebrewPrefixes {
            let toolURL = URL(fileURLWithPath: "\(prefix)/\(named)")
            if FileManager.default.fileExists(atPath: toolURL.path) {
                return toolURL
            }
        }

        return nil
    }
}
