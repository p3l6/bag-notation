//
//  Field.swift
//  Bag Notation
//

import Foundation

public struct Field {
    let label: FieldLabel
    private let _value: String?

    var value: String {
        guard let _value else {
            // Don't want to have to mark this property as throws,
            // So just log an error here and return the label.
            // Alternatively this could be a forced unwrap, since it should not happen.
            ModelParseError.logger.error("Tried to access field value of a label-only field")
            return label.rawValue
        }
        return _value
    }

    init(label rawLabel: FieldLabel.RawValue, value: String?) throws {
        guard let label = FieldLabel(rawValue: rawLabel) else { throw ModelParseError.invalidField }
        guard value != nil || !label.requiresValue else { throw ModelParseError.missingFieldValue }

        self.label = label
        _value = value
    }

    init(shorthand: String) throws {
        label = switch shorthand {
        case "&": .h
        case "^": .hold
        case "'": .sharp
        case ",": .flat
        case "=": .nat
        case "0", "1", "2", "3", "4": .v
        default: throw ModelParseError.invalidField
        }
        
        _value = switch shorthand {
        case "0": nil
        case "1", "2", "3", "4": shorthand
        default: nil
        }

    }

    func asVariation() -> Variation {
        _value == nil ? .none : .other(label: _value!)
    }

    func asTempo() throws -> Int {
        try Int(value) ?! ModelParseError.invalidTempo
    }

    func asDuration() throws -> Duration {
        switch value.lowercased() {
        case "sixteenth": .sixteenth
        case "eighth": .eighth
        case "quarter": .quarter
        case "half": .half
        default: throw ModelParseError.invalidNoteLength(why: "Not a recognized note length: sixteenth, eighth, quarter, half")
        }
    }

    func asRest(baseDuration: Duration) throws -> Bar.BarContent {
        switch (label, _value) {
        case (.rest, "bar"): .barRest
        case (.spacer, "bar"): .barSpacer
        case (.rest, nil): .rest(duration: baseDuration)
        case (.spacer, nil): .spacer(duration: baseDuration)
        case let (.rest, value): try .rest(duration: value!.toDuration(modifying: baseDuration))
        case let (.spacer, value): try .spacer(duration: value!.toDuration(modifying: baseDuration))
        default: throw ModelParseError.invalidNoteLength(why: "Could not determine length of rest")
        }
    }

    func reflow(context flow: FlowContext) throws -> FlowContext {
        switch label {
        case .time: FlowContext(from: flow, timeSignature: try value.toTimeSignature())
        case .note: FlowContext(from: flow, noteLength: try asDuration())
        case .v: FlowContext(from: flow, variation: asVariation())
        case .tempo: FlowContext(from: flow, tempo: try asTempo())
        case .text: FlowContext(from: flow, upcomingAnnotation: value)
        case .hold: FlowContext(from: flow, upcomingFermata: true)
        case .sharp: FlowContext(from: flow, upcomingAccidental: .sharp)
        case .flat: FlowContext(from: flow, upcomingAccidental: .flat)
        case .nat: FlowContext(from: flow, upcomingAccidental: .natural)
        case .chord: FlowContext(from: flow, upcomingChord: try Pitch.from(string: value))
        default: throw ModelParseError.unexpectedField(label: label)
        }
    }
}

public enum FieldLabel: String {
    case title
    case by
    case arr
    case style
    case note
    case time
    case tempo
    case trad
    case h
    case v
    case rev
    case text
    case hold
    case rest
    case spacer
    case sharp
    case flat
    case nat
    case newpage
    case chord

    var requiresValue: Bool {
        switch self {
        case .trad, .h, .v, .hold, .rest, .spacer, .sharp, .flat, .nat, .newpage:
            false
        default:
            true
        }
    }
}

extension [Field] {
    func uniqueByLabel() throws -> [FieldLabel: Field] {
        var byLabel = [FieldLabel: Field]()

        for field in self {
            guard byLabel[field.label] == nil else { throw ModelParseError.duplicateHeaderFields }
            byLabel[field.label] = field
        }

        return byLabel
    }
}
