//
//  Note.swift
//  Bag Notation
//

// TODO: upgrade to 5.9 for formatter

// Future embellishments:
// uxxd: e{fde}d ? No. 24, 63
// ttg: g{ege}g ? No. 64 (double tap on the piob high g)
// low g variation crunluath ?
// uw: taorluath a mach ? (on bcd)
// uww: crunluath a mach ? (on bcd)
// ?z: {geAfA}e ?
// ?z: {afege}f ? in No. 64

import Foundation

enum Pitch {
    case highA
    case highG
    case f
    case e
    case d
    case c
    case b
    case lowA
    case lowG

    static func from(string: String) -> Pitch? {
        switch string {
        case "a": .highA
        case "g": .highG
        case "f": .f
        case "e": .e
        case "d": .d
        case "c": .c
        case "b": .b
        case "r": .lowA
        case "q": .lowG
        default: nil
        }
    }

}

enum Embellishment: CaseIterable {
    case highAGracenote // or this could take a pitch arg? hmm, lots simpler?
    case fGracenote
    case gGracenote
    case eGracenote
    case dGracenote
    
    case tap
    case lightTap
    case tapWithGGracenote

    case doubling
    case halfDoubling // eg "light doubling"
    case doublingWithHighAGracenote

    case grip
    case rodin
    case odro
    case odroWithGGracenote
    case odroWithHighAGracenote

    case taorluath
    case taorluathFromD

    case crunluath
    case crunluathFromD

    case special
    case lightSpecial
    case wideSpecial
    case lightWideSpecial

    case strike
    case lightStrike
    case pelay

    case birl
    case birlWithHighAGracenote
    case birlWithHighGGracenote
    case birlWithoutInitialA
    case birlWithDGracenote

    case cadence
    case cadenceWithHighAGracenote
    case halfCadence
    case halfCadenceWithHighAGracenote

    func isAllowedOn(_ pitch: Pitch) -> Bool {
        switch self {
        case .gGracenote: return pitch != .highA && pitch != .highG
        default: return true
        }
    }

    func gracenotes(for pitch: Pitch) -> [Pitch]? {
        // move outside enum, fileprivate, with a wrapper here and in pitch
        // same with allowedOn

        // build a static lookup table at startup
        // use it for this and the allowedOn method
        // this should throw

        var lookupTable = [Embellishment: PitchMap]()

        struct PitchMap {
            let highA: [Pitch]?
            let highG: [Pitch]?
            let f: [Pitch]?
            let e: [Pitch]?
            let d: [Pitch]?
            let c: [Pitch]?
            let b: [Pitch]?
            let lowA: [Pitch]?
            let lowG: [Pitch]?

            init(highA: [Pitch]? = nil, highG: [Pitch]? = nil, f: [Pitch]? = nil, e: [Pitch]? = nil, d: [Pitch]? = nil, c: [Pitch]? = nil, b: [Pitch]? = nil, lowA: [Pitch]? = nil, lowG: [Pitch]? = nil) {
                self.highA = highA
                self.highG = highG
                self.f = f
                self.e = e
                self.d = d
                self.c = c
                self.b = b
                self.lowA = lowA
                self.lowG = lowG
            }

            init(base: PitchMap? = nil, setting: [Pitch], for pitches: Set<Pitch>) {
                highA = pitches.contains(.highA) ? setting : base?.highA
                highG = pitches.contains(.highG) ? setting : base?.highG
                f = pitches.contains(.f) ? setting : base?.f
                e = pitches.contains(.e) ? setting : base?.e
                d = pitches.contains(.d) ? setting : base?.d
                c = pitches.contains(.c) ? setting : base?.c
                b = pitches.contains(.b) ? setting : base?.b
                lowA = pitches.contains(.lowA) ? setting : base?.lowA
                lowG = pitches.contains(.lowG) ? setting : base?.lowG
            }

            init(base: PitchMap? = nil, setting: [Pitch], for pitch: Pitch) {
                self.init(base: base, setting: setting, for: Set([pitch]))
            }

            func setting(_ setting: [Pitch], for pitches: Set<Pitch>) -> PitchMap {
                return PitchMap(base: self, setting: setting, for: pitches)
            }
            func setting(_ setting: [Pitch], for pitch: Pitch) -> PitchMap {
                return PitchMap(base: self, setting: setting, for: pitch)
            }

            static func empty() -> PitchMap {
                return PitchMap(base: nil, setting: [], for: Set())
            }

            subscript(p: Pitch) -> [Pitch]? {
                switch p {
                case .highA: highA
                case .highG: highG
                case .f:     f
                case .e:     e
                case .d:     d
                case .c:     c
                case .b:     b
                case .lowA:  lowA
                case .lowG: lowG
                }
            }

        }

        func pitchRange(from: Pitch, to: Pitch) -> Set<Pitch> {
            // TODO: this, but with the range operator instead. custom struct. init with range operator, or single or all or list
            return Set([.highA])
        }

        let all = Set<Pitch>([.highA, .highG, .f, .e, .d, .c, .b, .lowA, .lowG])

        for emb in Embellishment.allCases {
            lookupTable[emb] = switch emb {
            case .highAGracenote: PitchMap(setting: [.highA], for: pitchRange(from: .lowG, to: .highG))
            case .fGracenote: PitchMap(setting: [.f], for: pitchRange(from: .lowG, to: .e))
            case .gGracenote: PitchMap(setting: [.highG], for: pitchRange(from: .lowG, to: .f))
            case .eGracenote: PitchMap(setting: [.e], for: pitchRange(from: .lowG, to: .d))
            case .dGracenote: PitchMap(setting: [.d], for: pitchRange(from: .lowG, to: .c))
            case .tap: PitchMap(
                highA: [.highG],
                highG: [.f],
                f: [.e],
                e: [.lowA],
                d: [.lowG],
                c: [.lowG],
                b: [.lowG],
                lowA: [.lowG])
            case .lightTap: PitchMap(
                highG: [.e],
                d: [.c],
                c: [.b],
                b: [.lowA])
            case .tapWithGGracenote: PitchMap(
                d: [.highG, .c],
                c: [.highG, .b],
                b: [.highG, .lowA],
                lowA: [.highG, .lowG])
            case .doubling:  PitchMap(
                highA: [.highA, .highG],
                highG: [.highG, .f],
                f: [.highG, .f, .highG],
                e: [.highG, .e, .f],
                d: [.highG, .d, .e],
                c: [.highG, .c, .d],
                b: [.highG, .b, .d],
                lowA: [.highG, .lowA, .d],
                lowG: [.highG, .lowG, .d])
            case .halfDoubling: PitchMap(
                highG: [.highG, .highA],
                f: [.f, .highG],
                e: [.e, .f],
                d: [.d, .e],
                c: [.c, .d],
                b: [.b, .d],
                lowA: [.lowA, .d],
                lowG: [.lowG, .d])
            case .doublingWithHighAGracenote: PitchMap(
                f: [.highA, .f, .highG],
                e: [.highA, .e, .f],
                d: [.highA, .d, .e],
                c: [.highA, .c, .d],
                b: [.highA, .b, .d],
                lowA: [.highA, .lowA, .d],
                lowG: [.highA, .lowG, .d])
            case .grip: PitchMap(setting: [.lowG, .d, .lowG], for: all).setting([.lowG, .e, .lowG], for: .d)
            case .rodin: PitchMap(
                e: [.lowG, .b, .lowG],
                lowA: [.lowG, .b, .lowG])
            case .odro: PitchMap(
                d: [.d, .lowG, .e, .lowG],
                c: [.c, .lowG, .d, .lowG],
                b: [.b, .lowG, .d, .lowG])
            case .odroWithGGracenote: PitchMap(
                d: [.highG, .d, .lowG, .e, .lowG],
                c: [.highG, .c, .lowG, .d, .lowG],
                b: [.highG, .b, .lowG, .d, .lowG])
            case .odroWithHighAGracenote: PitchMap(
                d: [.highA, .d, .lowG, .e, .lowG],
                c: [.highA, .c, .lowG, .d, .lowG],
                b: [.highA, .b, .lowG, .d, .lowG])
            case .taorluath: PitchMap(setting: [.lowG, .d, .lowG, .e], for: pitchRange(from: .lowA, to: .d))
            case .taorluathFromD: PitchMap(setting: [.lowG, .b, .lowG, .e], for: .d)
            case .crunluath: PitchMap(setting: [.lowG, .d, .lowG, .e, .lowA, .f, .lowA], for: .e)
            case .crunluathFromD: PitchMap(setting: [.lowG, .b, .lowG, .e, .lowA, .f, .lowA], for: .e)
            case .special: PitchMap(
                highG: [.e, .lowA, .f, .lowA],
                f: [.f, .e, .highG, .e],
                e: [.e, .lowA, .f, .lowA],
                d: [.lowG, .d, .c],
                b: [.lowG, .d, .lowG, .c, .lowG])
            case .lightSpecial: PitchMap(
                highG: [.e, .lowG, .f, .lowG],
                d: [.d, .c])
            case .wideSpecial: PitchMap(setting: [.f, .e, .highG, .e, .f, .e], for: .highG)
            case .lightWideSpecial: PitchMap(setting: [.e, .highG, .e, .f, .e], for: .highG)
            case .strike: PitchMap(
                f: [.highG, .f, .e],
                e: [.highG, .e, .lowA],
                d: [.highG, .d, .lowG],
                c: [.highG, .c, .lowG],
                b: [.highG, .b, .lowG],
                lowA: [.highG, .lowA, .lowG])
            case .lightStrike: PitchMap(
                e: [.e, .lowA],
                d: [.highG, .d, .c],
                b: [.b, .lowG])
            case .pelay: PitchMap(
                d: [.highG, .d, .e, .d, .lowG],
                c: [.highG, .c, .e, .c, .lowG],
                b: [.highG, .b, .e, .b, .lowG])
            case .birl: PitchMap(setting: [.lowA, .lowG, .lowA, .lowG], for: .lowA)
            case .birlWithHighAGracenote: PitchMap(setting: [.highA, .lowA, .lowG, .lowA, .lowG], for: .lowA)
            case .birlWithHighGGracenote: PitchMap(setting: [.highG, .lowA, .lowG, .lowA, .lowG], for: .lowA)
            case .birlWithoutInitialA: PitchMap(setting: [.lowG, .lowA, .lowG], for: .lowA)
            case .birlWithDGracenote: PitchMap(setting: [.d, .lowA, .lowG, .lowA, .lowG], for: .lowA)
                // TODO: cadences should be `e4` timing
            case .cadence: PitchMap(setting: [.highG, .e, .d], for: pitchRange(from: .lowA, to: .c))
            case .cadenceWithHighAGracenote: PitchMap(setting: [.highA, .e, .d], for: pitchRange(from: .lowA, to: .c))
            case .halfCadence: PitchMap(setting: [.highG, .e], for: pitchRange(from: .lowG, to: .d))
            case .halfCadenceWithHighAGracenote: PitchMap(setting: [.highA, .e], for: pitchRange(from: .lowG, to: .d))
            }
        }
        return lookupTable[self]?[pitch]
    }

    static func from(string: String) -> Embellishment? {
        switch string {
        case "x": .gGracenote
        case "px": .dGracenote
        case "hx": .highAGracenote
        case "lx": .eGracenote
        case "ux": .fGracenote
        case "xx": .doubling
        case "hxx": .doublingWithHighAGracenote
        case "lxx": .halfDoubling
        case "t": .tap
        case "lt": .lightTap
        case "xt": .tapWithGGracenote
        case "tt": .birl
        case "ptt": .birlWithDGracenote
        case "htt": .birlWithHighAGracenote
        case "ltt": .birlWithoutInitialA
        case "xtt": .birlWithHighGGracenote
        case "v": .grip
        case "pv": .rodin
        case "vv": .odro
        case "xvv": .odroWithGGracenote
        case "hvv": .odroWithHighAGracenote
        case "w": .taorluath
        case "pw": .taorluathFromD
        case "ww": .crunluath
        case "pww": .crunluathFromD
        case "z": .special
        case "lz": .lightSpecial
        case "zz": .wideSpecial
        case "lzz": .lightWideSpecial
        case "k": .strike
        case "lk": .lightStrike
        case "kk": .pelay
        case "n": .cadence
        case "hn": .cadenceWithHighAGracenote
        case "ln": .halfCadence
        case "un": .halfCadenceWithHighAGracenote

        default: nil
        }
    }
}

struct Note {
    let pitch: Pitch // enum
    let embellishment: Embellishment?
    let duration: String
    let extras: String // extra characters we don't understand? need to elaborate on this.
}

