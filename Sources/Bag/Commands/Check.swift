//
//  Check.swift
//  Bag Notation
//

import ArgumentParser

struct Check: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Check a bag notation file for parse errors."
    )

    @OptionGroup var options: Bag.InputOptions

    mutating func run() async throws {
        print("TODO: implementation")
    }
}
