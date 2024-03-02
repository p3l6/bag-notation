//
//  ModelParseError.swift
//  Bag Notation
//

import os
import Foundation

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
    case invalidField

    public var errorDescription: String? {
        switch self {
        case .fileParseError: "File parsing error"
        case .unknownNodeType(let type): "Unknown node type: \(type)"
        case .nodeHasNoChildren: "Node has no children"
        case .cursorFailedToReturnToParent: "Cursor failed to return to parent"
        case .cursorAtInvalidNode: "Cursor at invalid node"
        case .nodeMissingChild: "Node missing child"
        case .unexpectedNodeType(let type): "Unexpected node type: \(type)"
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
