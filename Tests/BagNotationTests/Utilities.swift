//
//  Utilities.swift
//  Bag Notation
//

@testable import BagNotation

func makeFile(from source: String) throws -> Doc {
    // Swift multiline strings do not end in a newline
    // This is easier than making sure they exist in every test path.
    let withFinalNewline = source + "\n"
    return try BagReader(withFinalNewline).makeModel()
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

func makeLineVoice(from fragment: String) throws -> Voice {
    try makeFile(from: """
        ---
        title: test
        by: test
        style: 4/4 March
        ---
        \(fragment)
        """)
    .tunes[0]
    .lines[0]
    .melody
}

func makeBar(from fragment: String) throws -> Bar {
    try makeFile(from: """
        ---
        title: test 
        by: test
        style: 4/4 March
        ---
        | abcd | \(fragment)
        """)
    .tunes[0]
    .lines[0]
    .melody
    .bars[1]
}

func makeCluster(from fragment: String) throws -> [Note] {
    let content = try makeFile(from: """
        ---
        title: test
        by: test
        style: 4/4 March
        ---
        | \(fragment) abcd |
        """)
    .tunes[0]
    .lines[0]
    .melody
    .bars[0]
    .contents[0]

    switch content {
    case let .cluster(cluster): return cluster.notes
    default: throw TestingHelperError.barContentIsNotCluster
    }
}

enum TestingHelperError: Error {
    case barContentIsNotCluster
}
