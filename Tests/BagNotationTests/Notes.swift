//
//  Notes.swift
//  Bag Notation
//

@testable import BagNotation
import Testing

struct Notes {
    @Test
    func pitches() throws {
        let notes = try makeCluster(from: "labcdefgh")
        #expect(notes.map(\.pitch) == [.lowG, .lowA, .b, .c, .d, .e, .f, .highG, .highA])

        let gracenotes = try makeCluster(from: "qojkpzuymd")
        #expect(gracenotes[0].embellishment?.pitches == [.lowG, .lowA, .b, .c, .d, .e, .f, .highG, .highA])
    }

    @Test
    func embellishments() throws {
        var notes = try makeCluster(from: "xcpczcucgxc")
        #expect(notes.map(\.embellishment?.pitches) == [[.highG], [.d], [.e], [.f], nil, [.highA]])

        notes = try makeCluster(from: "tdsdykd")
        #expect(notes.map(\.embellishment?.pitches) == [[.lowG], [.c], [.highG, .c]])

        notes = try makeCluster(from: "xxcgxxcanxc")
        #expect(notes.map(\.embellishment?.pitches) == [[.highG, .c, .d], nil, [.highA, .c, .d], nil, [.c, .d]])

        notes = try makeCluster(from: "vcdvanvcxvcgxvc")
        #expect(notes.map(\.embellishment?.pitches) == [[.lowG, .d, .lowG], nil, [.lowG, .b, .lowG], [.c, .lowG, .d, .lowG], [.highG, .c, .lowG, .d, .lowG], nil, [.highA, .c, .lowG, .d, .lowG]])

        notes = try makeCluster(from: "vzadvzavrevzue")
        #expect(notes.map(\.embellishment?.pitches) == [[.lowG, .d, .lowG, .e], nil, [.lowG, .b, .lowG, .e], [.lowG, .d, .lowG, .e, .lowA, .f, .lowA], [.lowG, .d, .lowG, .e, .lowA, .f, .lowA]])

        notes = try makeCluster(from: "rdlrdrerfrgrg")
        #expect(notes.map(\.embellishment?.pitches) == [[.lowG, .d, .c], nil, [.d, .c], [.e, .lowA, .f, .lowA], [.f, .e, .highG, .e], [.e, .highG, .e, .f, .e], [.f, .e, .highG, .e, .f, .e]])

        notes = try makeCluster(from: "xtdxsdxxtd")
        #expect(notes.map(\.embellishment?.pitches) == [[.highG, .d, .lowG], [.highG, .d, .c], [.highG, .d, .e, .d, .lowG]])

        notes = try makeCluster(from: "ttanttaxttagxtta")
        #expect(notes.map(\.embellishment?.pitches) == [[.lowG, .lowA, .lowG], [.lowA, .lowG, .lowA, .lowG], [.highG, .lowA, .lowG, .lowA, .lowG], nil, [.highA, .lowA, .lowG, .lowA, .lowG]])
    }

    @Test
    func mismatchedEmbellishments() throws {
        #expect(throws: LocatedModelParseError.self) { try makeCluster(from: "xh") }
        #expect(throws: LocatedModelParseError.self) { try makeCluster(from: "rl") }
        #expect(throws: LocatedModelParseError.self) { try makeCluster(from: "vze") }
        #expect(throws: NoteParseError.self) { try makeCluster(from: "zra") }
    }

    @Test
    func noteDuration() throws {
        let notes = try makeCluster(from: "cc+c+.c.d/c++d/.c/c//c+++")
        #expect(notes.map(\.duration) == [.eighth, .quarter, .quarterDotted, .eighthDotted, .sixteenth, .half, .sixteenthDotted, .sixteenth, .thirtysecond, .whole])

        // TODO: note is too short
        // TODO: too long?
    }

    @Test
    func ties() throws {
        let notes = try makeCluster(from: "c+_cxc_d_e")
        #expect(notes.map(\.tiedToNext) == [true, false, true, true, false])
    }

    @Test
    func triplets() throws {
        var notes = try makeCluster(from: "xxexd-e-fg")
        #expect(notes.map(\.context.body.tupletSize) == [0, 3, 3, 3, 0])
        #expect(notes.map(\.context.body.tupletNumber) == [0, 1, 2, 3, 0])

        notes = try makeCluster(from: "xd-e-fxe-d-c")
        #expect(notes.map(\.context.body.tupletSize) == [3, 3, 3, 3, 3, 3])
        #expect(notes.map(\.context.body.tupletNumber) == [1, 2, 3, 1, 2, 3])
    }

    @Test
    func tuplets() throws {
        var notes = try makeCluster(from: "a-b-c-d-e-fgbd")
        #expect(notes.map(\.context.body.tupletSize) == [6, 6, 6, 6, 6, 6, 0, 0, 0])
        #expect(notes.map(\.context.body.tupletNumber) == [1, 2, 3, 4, 5, 6, 0, 0, 0])

        notes = try makeCluster(from: "a+-b+-c+-d+")
        #expect(notes.map(\.context.body.tupletSize) == [4, 4, 4, 4])
        #expect(notes.map(\.context.body.tupletNumber) == [1, 2, 3, 4])
    }
}
