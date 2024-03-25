//
//  Embellishment.swift
//  Bag Notation
//

import Foundation

public struct Embellishment {
    let type: EmbellishmentType
    let playedOn: Pitch
    let pitches: [Pitch]

    init(type: EmbellishmentType, from: Pitch, on pitch: Pitch) throws {
        self.type = type
        playedOn = pitch

        pitches = try pitchesFor(type, from: from, on: pitch)
    }

    init(string: String, from: Pitch, on pitch: Pitch) throws {
        try self.init(type: EmbellishmentType.from(string: string), from: from, on: pitch)
    }
}

func parseLiteral(_ str: String) -> [Pitch]? {
    do {
        return try str.map { try String($0).toPitch() }
    } catch {
        return nil
    }
}

enum EmbellishmentType {
    case literal(pitches: [Pitch])

    case singling
    case tap(soft: Bool)

    case doubling(half: Bool)

    case grip
    case odro(withLeadingGrace: Bool)

    case anyThrow // "throw" is a reserved swift keyword

    case taorluath
    case crunluath

    case strike(half: Bool, light: Bool)
    case pelay(light: Bool)

    /// `withLeadingGrace` implies `withInitialA` and as a result the latter is ignored
    case birl(withLeadingGrace: Bool, withInitialA: Bool)
    case birlWithDGracenote

    // TODO: cadence, halfcadence
    // TODO: cadences should be `e4` timing
    // crun a mach, toar a mach?
    // crun with low g's
    // TODO: other stuff
    // uxxd: e{fde}d ? No. 24, 63
    // ttg: g{ege}g ? No. 64 (double tap on the piob high g)
    // low g variation crunluath ?
    // uw: taorluath a mach ? (on bcd)
    // uww: crunluath a mach ? (on bcd)
    // ?z: {geAfA}e ?
    // ?z: {afege}f ? in No. 64
}

// MARK: Create from strings

extension EmbellishmentType {
    static func from(string: String) throws -> EmbellishmentType {
        if let literal = parseLiteral(string) {
            return .literal(pitches: literal)
        }

        return switch string {
        case "x": .singling
        case "s": .tap(soft: true)
        case "t": .tap(soft: false)
        case "xx", "xnx": .doubling(half: false)
        case "nx": .doubling(half: true)
        case "v": .grip
        case "nv": .odro(withLeadingGrace: false)
        case "xv", "xnv": .odro(withLeadingGrace: true)
        case "vz": .taorluath
        case "vr", "vzu": .crunluath
        case "r": .anyThrow
        case "xt", "xnt": .strike(half: false, light: false)
        case "xs", "xns": .strike(half: false, light: true)
        case "nt": .strike(half: true, light: false)
        case "ns": .strike(half: true, light: true)
        case "xxt", "xnxnt": .pelay(light: false)
        case "xxs", "xnxns": .pelay(light: true)
        case "tt", "tnt": .birl(withLeadingGrace: false, withInitialA: false)
        case "ntt", "ntnt": .birl(withLeadingGrace: false, withInitialA: true)
        case "xtt", "xntnt": .birl(withLeadingGrace: true, withInitialA: true)
        case "ptt", "pntnt": .birlWithDGracenote

        default: throw NoteParseError.unknownEmbellishment
        }
    }
}

extension String {
    func toEmbellishmentType() throws -> EmbellishmentType { try EmbellishmentType.from(string: self) }
}

// MARK: Embellishment Map Table

private func pitchesFor(_ emb: EmbellishmentType, from: Pitch, on pitch: Pitch) throws -> [Pitch] {
    let pitchesWithNils: [Pitch?] = switch (emb, from, pitch) {
    case let (.literal(pitches), _, _): pitches

    case (.singling, .highG, .lowG ... .f): [.highA]
    case (.singling, _, .lowG ... .f): [.highG]
    case (.singling, _, .highG): [.highA]

    case (.tap, _, .highA): [.highG]
    case let (.tap(soft), _, .highG): soft ? [.e] : [.f]
    case (.tap, _, .f): [.e]
    case (.tap, _, .e): [.lowA]
    case let (.tap(soft), _, .d): soft ? [.c] : [.lowG]
    case let (.tap(soft), _, .c): soft ? [.b] : [.lowG]
    case let (.tap(soft), _, .b): soft ? [.lowA] : [.lowG]
    case (.tap, _, .lowA): [.lowG]

    case (.doubling, _, .highA): [.highA, .highG]
    case let (.doubling(half), _, .highG): half ? [.highG, .highA] : [.highG, .f]
    case (.doubling, .highG, .f): [.highA, .f, .highG]
    case let (.doubling(half), _, .f): half ? [.f, .highG] : [.highG, .f, .highG]
    case (.doubling, .highG, .e): [.highA, .e, .f]
    case let (.doubling(half), _, .e): half ? [.e, .f] : [.highG, .e, .f]
    case (.doubling, .highG, .d): [.highA, .d, .e]
    case let (.doubling(half), _, .d): half ? [.d, .e] : [.highG, .d, .e]
    case (.doubling, .highG, .c): [.highA, .c, .d]
    case let (.doubling(half), _, .c): half ? [.c, .d] : [.highG, .c, .d]
    case (.doubling, .highG, .b): [.highA, .b, .d]
    case let (.doubling(half), _, .b): half ? [.b, .d] : [.highG, .b, .d]
    case (.doubling, .highG, .lowA): [.highA, .lowA, .d]
    case let (.doubling(half), _, .lowA): half ? [.lowA, .d] : [.highG, .lowA, .d]
    case (.doubling, .highG, .lowG): [.highA, .lowG, .d]
    case let (.doubling(half), _, .lowG): half ? [.lowG, .d] : [.highG, .lowG, .d]

    case (.grip, _, .d): [.lowG, .e, .lowG]
    case (.grip, .d, .lowA): [.lowG, .b, .lowG]
    case (.grip, _, _): [.lowG, .d, .lowG]
    case (.odro(true), .highG, .d): [.highA, .d, .lowG, .e, .lowG]
    case let (.odro(withLeadingGrace), _, .d): withLeadingGrace ? [.highG, .d, .lowG, .e, .lowG] : [.d, .lowG, .e, .lowG]
    case (.odro(true), .highG, .c): [.highA, .c, .lowG, .d, .lowG]
    case let (.odro(withLeadingGrace), _, .c): withLeadingGrace ? [.highG, .c, .lowG, .d, .lowG] : [.c, .lowG, .d, .lowG]
    case (.odro(true), .highG, .b): [.highA, .b, .lowG, .d, .lowG]
    case let (.odro(withLeadingGrace), _, .b): withLeadingGrace ? [.highG, .b, .lowG, .d, .lowG] : [.b, .lowG, .d, .lowG]

    case (.taorluath, .d, .lowA): [.lowG, .b, .lowG, .e]
    case (.taorluath, _, .lowA ... .d): [.lowG, .d, .lowG, .e]
    case (.crunluath, .d, .e): [.lowG, .b, .lowG, .e, .lowA, .f, .lowA]
    case (.crunluath, _, .e): [.lowG, .d, .lowG, .e, .lowA, .f, .lowA]

    case (.anyThrow, _, .highG): [.f, .e, .highG, .e, .f, .e]
    case (.anyThrow, _, .f): [.f, .e, .highG, .e]
    case (.anyThrow, _, .e): [.e, .lowA, .f, .lowA]
    case (.anyThrow, .lowG, .d): [.d, .c]
    case (.anyThrow, _, .d): [.lowG, .d, .c]
    case (.anyThrow, _, .b): [.lowG, .d, .lowG, .c, .lowG]

    case (.strike(false, false), .highG, .f): [.highA, .f, .e]
    case (.strike(false, false), _, .f): [.highG, .f, .e]
    case (.strike(false, false), .highG, .e): [.highA, .e, .lowA]
    case (.strike(let half, false), _, .e): [half ? nil : .highG, .e, .lowA]
    case (.strike(false, false), .highG, .d): [.highA, .d, .lowG]
    case let (.strike(half, light), _, .d): [half ? nil : .highG, .d, light ? .c : .lowG]
    case (.strike(false, false), .highG, .c): [.highA, .c, .lowG]
    case (.strike(false, false), _, .c): [.highG, .c, .lowG]
    case (.strike(false, false), .highG, .b): [.highA, .b, .lowG]
    case (.strike(let half, false), _, .b): [half ? nil : .highG, .b, .lowG]
    case (.strike(false, false), .highG, .lowA): [.highA, .lowA, .lowG]
    case (.strike(false, false), _, .lowA): [.highG, .lowA, .lowG]

    case let (.pelay(light), .highG, .d): [.highA, .d, .e, light ? .c : .d, .lowG]
    case let (.pelay(light), _, .d): [.highG, .d, .e, light ? .c : .d, .lowG]
    case (.pelay, .highG, .c): [.highA, .c, .e, .c, .lowG]
    case (.pelay, _, .c): [.highG, .c, .e, .c, .lowG]
    case (.pelay, .highG, .b): [.highA, .b, .e, .b, .lowG]
    case (.pelay, _, .b): [.highG, .b, .e, .b, .lowG]

    case (.birl(true, _), .highG, .lowA): [.highA, .lowA, .lowG, .lowA, .lowG]
    case (.birl(true, _), _, .lowA): [.highG, .lowA, .lowG, .lowA, .lowG]
    case (.birl(false, let withInitialA), _, .lowA): [withInitialA ? .lowA : nil, .lowG, .lowA, .lowG]
    case (.birlWithDGracenote, _, .lowA): [.d, .lowA, .lowG, .lowA, .lowG]

    default: throw ModelParseError.invalidEmbellishment
    }

    return pitchesWithNils.compactMap { $0 }
}
