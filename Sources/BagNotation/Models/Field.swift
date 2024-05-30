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
        default: throw ModelParseError.invalidField
        }
        _value = nil
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

    var requiresValue: Bool {
        switch self {
        case .trad, .h, .v:
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
