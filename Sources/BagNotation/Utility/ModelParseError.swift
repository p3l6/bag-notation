//
//  ModelParseError.swift
//  Bag Notation
//

import Foundation
import os

public enum ModelParseError: Error, LocalizedError {
    static let logger = Logger(subsystem: "BagNotation", category: "ModelParseError")

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
        case .invalidNoteLength: "Invalid note length"
        case .invalidField: "Invalid field"
        case .invalidTempo: "Invalid tempo"
        }
    }

    func log() { Self.logger.error("\(self.errorDescription!)") }
}

public struct LocatedModelParseError: Error, LocalizedError {
    let base: ModelParseError
    let location: String

    public var errorDescription: String? {
        "\(location): \(base.errorDescription!)"
    }

    func log() { ModelParseError.logger.error("\(self.errorDescription!)") }
}
