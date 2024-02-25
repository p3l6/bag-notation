//
//  ModelParseError.swift
//  Bag Notation
//

import os

enum ModelParseError: Error {
    static let logger = Logger(subsystem: "BagNotation", category: "ModelParseError")

    case fileParseError
    case unknownNodeType
    case nodeHasNoChildren
    case cursorFailedToReturnToParent
    case cursorAtInvalidNode
    case nodeMissingChild
    case unexpectedNodeType
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

    // TODO: localized errror with description and suggestion
}
