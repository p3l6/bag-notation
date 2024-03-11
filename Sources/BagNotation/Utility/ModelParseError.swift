//
//  ModelParseError.swift
//  Bag Notation
//

import Foundation
import os

public enum ModelParseError: Error, LocalizedError {
    static let logger = Logger(subsystem: "BagNotation", category: "ModelParseError")

    case fileParseError
    case unknownNodeType(type: String)
    case nodeHasNoChildren
    case cursorFailedToReturnToParent
    case cursorAtInvalidNode
    case nodeMissingChild
    case unexpectedNodeType(type: String)
    case missingBarline
    case noteTooShort
    case noteTooLong
    case noteAlreadyDotted
    case fieldMissingValue
    case duplicateHeaderFields
    case duplicateComposers

    case tuneMissingTitle
    case tuneMissingComposer
    case tuneMissingStyle
    case tuneMissingTimeSignature

    case invalidEmbellishment
    case invalidStyle
    case invalidTimeSignature
    case invalidBarline
    case invalidNoteLength
    case invalidTempo
    case invalidField

    // TODO: clean up unused

    public var errorDescription: String? {
        switch self {
        case .fileParseError: "File parsing error"
        case let .unknownNodeType(type): "Unknown node type: \(type)"
        case .nodeHasNoChildren: "Node has no children"
        case .cursorFailedToReturnToParent: "Cursor failed to return to parent"
        case .cursorAtInvalidNode: "Cursor at invalid node"
        case .nodeMissingChild: "Node missing child"
        case let .unexpectedNodeType(type): "Unexpected node type: \(type)"
        case .missingBarline: "Missing barline"
        case .noteTooShort: "Note is too short"
        case .noteTooLong: "Note is too long"
        case .noteAlreadyDotted: "Note is already dotted"
        case .fieldMissingValue: "Field is missing value"
        case .duplicateHeaderFields: "Duplicate header fields"
        case .duplicateComposers: "Duplicate composers"

        case .tuneMissingTitle: "Tune missing title"
        case .tuneMissingComposer: "Tune missing composer"
        case .tuneMissingStyle: "Tune missing style"
        case .tuneMissingTimeSignature: "Tune missing time signature"

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
