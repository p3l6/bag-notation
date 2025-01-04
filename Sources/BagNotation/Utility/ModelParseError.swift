//
//  ModelParseError.swift
//  Bag Notation
//

import Foundation

public enum ModelParseError: Error, LocalizedError {
    case fileParseError

    case duplicateUniqueNodeChildren(type: String)
    case duplicateHeaderFields
    case duplicateComposers

    case unexpectedNodeType(type: String)
    case unexpectedField(label: FieldLabel)

    case missingNodeChild
    case missingFunctionImplementation
    case missingFieldValue
    case missingTuneTitle
    case missingTuneComposer
    case missingTuneStyle
    case missingTuneTimeSignature

    case invalidEmbellishment
    case invalidStyle
    case invalidTimeSignature
    case invalidBarline
    case invalidNoteLength(why: String)
    case invalidTempo
    case invalidField
    case invalidNoteConnector
    case invalidChord

    public var errorDescription: String? {
        switch self {
        case .fileParseError: "File parsing error"
        case let .duplicateUniqueNodeChildren(type): "Node has duplicate children of type: \(type)"
        case .duplicateHeaderFields: "Duplicate header fields"
        case .duplicateComposers: "Duplicate composers"
        case let .unexpectedNodeType(type): "Unexpected node type: \(type)"
        case let .unexpectedField(label): "A field with this label was unexpected here: \(label.rawValue)"
        case .missingNodeChild: "Node is missing a required child"
        case .missingFunctionImplementation: "Internal error: function implementation is missing"
        case .missingFieldValue: "Field is missing value"
        case .missingTuneTitle: "Tune missing title"
        case .missingTuneComposer: "Tune missing composer"
        case .missingTuneStyle: "Tune missing style"
        case .missingTuneTimeSignature: "Tune missing time signature"
        case .invalidEmbellishment: "Invalid embellishment"
        case .invalidStyle: "Invalid style"
        case .invalidTimeSignature: "Invalid time signature"
        case .invalidBarline: "Invalid barline"
        case let .invalidNoteLength(reason): "Invalid note length: \(reason)"
        case .invalidField: "Invalid field"
        case .invalidTempo: "Invalid tempo"
        case .invalidNoteConnector: "Invalid note connector"
        case .invalidChord: "Chord pitch may not be applied to itself"
        }
    }
}

public struct LocatedModelParseError: Error, LocalizedError {
    let base: ModelParseError
    let location: InlineRange

    public var errorDescription: String? {
        "\(location.line + 1)[\(location.lowerBound + 1)-\(location.upperBound)]: \(base.errorDescription!)"
    }
}
