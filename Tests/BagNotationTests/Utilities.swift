//
//  Utilities.swift
//  Bag Notation
//

@testable import BagNotation

func file(from source: String) throws -> Doc {
    // Swift multiline strings do not end in a newline
    // This is easier than making sure they exist in every test path.
    let withFinalNewline = source + "\n"
    return try ModelBuilder(withFinalNewline).makeModel()
}

func header(from fragment: String) throws -> Header {
    try file(from: """
        ---
        \(fragment)
        ---
        | abcd |
        """)
    .tunes[0]
    .header
}

func line(from fragment: String) throws -> Line {
    try file(from: """
        ---
        title: test by test
        style: 4/4 March
        ---
        \(fragment)
        """)
    .tunes[0]
    .lines[0]
}

func bar(from fragment: String) throws -> Bar {
    try file(from: """
        ---
        title: test by test
        style: 4/4 March
        ---
        | abcd | \(fragment)
        """)
    .tunes[0]
    .lines[0]
    .bars[1]
}

func noteCluster(from fragment: String) throws -> [Note] {
    try file(from: """
        ---
        title: test by test
        style: 4/4 March
        ---
        | \(fragment) abcd |
        """)
    .tunes[0]
    .lines[0]
    .bars[0]
    .notes
}
