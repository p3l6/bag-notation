//
//  Utilities.swift
//  Bag Notation
//

@testable import BagNotation

func makeFile(from source: String) throws -> Doc {
    // Swift multiline strings do not end in a newline
    // This is easier than making sure they exist in every test path.
    let withFinalNewline = source + "\n"
    return try ModelBuilder(withFinalNewline).makeModel()
}

func makeHeader(from fragment: String) throws -> Header {
    try makeFile(from: """
        ---
        \(fragment)
        ---
        | abcd |
        """)
    .tunes[0]
    .header
}

func makeLine(from fragment: String) throws -> Line {
    try makeFile(from: """
        ---
        title: test by test
        style: 4/4 March
        ---
        \(fragment)
        """)
    .tunes[0]
    .lines[0]
}

func makeBar(from fragment: String) throws -> Bar {
    try makeFile(from: """
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

func makeNoteCluster(from fragment: String) throws -> [Note] {
    try makeFile(from: """
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
