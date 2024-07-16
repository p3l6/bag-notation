//
//  LineStructure.swift
//  Bag Notation
//

@testable import BagNotation
import Testing

struct LineStructure {
    @Test
    func barCounts() throws {
        var line = try makeLineVoice(from: "| abc def | abc def | abc def |")
        #expect(line.bars.count == 3)

        line = try makeLineVoice(from: "ef | abc def | abc def |")
        #expect(line.bars.count == 3)
    }

    @Test
    func pickupBars() throws {
        var line = try makeLineVoice(from: "| ab cd ef gg | cc dd cc ff | aa bc de f |")
        #expect(line.bars.map(\.isPickup) == [false, false, false])

        line = try makeLineVoice(from: "ef | abc def abc def | ff |")
        #expect(line.bars.count == 3)
        #expect(line.bars.map(\.isPickup) == [true, false, false])

        line = try makeLineVoice(from: "ef ab cd ad | abc def abc def | ff |")
        #expect(line.bars.count == 3)
        #expect(line.bars.map(\.isPickup) == [false, false, false])
    }

    @Test
    func barlineTypes() throws {
        let line = try makeLineVoice(from: "|| abc def |: abc def | abc def :| abc def || abc def ||")
        #expect(line.leadingBarline == .partStart)
        #expect(line.bars.map(\.trailingBarline) == [.repeatStart, .plain, .repeatEnd, .double, .partEnd])
    }

    @Test
    func clusters() throws {
        let line = try makeLineVoice(from: "| abc def | abcdef | ab cd ef |")
        #expect(line.bars.map(\.contents.count) == [2, 1, 3])
    }

    @Test
    func missingTrailingBarline() throws {
        #expect(throws: LocatedModelParseError.self) { try makeLineVoice(from: "| abc def | abc def | abc def") }
    }
}
