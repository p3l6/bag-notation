//
//  BagTree.swift
//  Bag Notation
//

import SwiftTreeSitter
import TreeSitterBagNotation

public class BagTree: NodeSourceTextProvider {
    let source: String
    public init(_ source: String) { self.source = source }

    lazy var tree: Tree = {
        let language = Language(language: tree_sitter_BagNotation())
        let parser = Parser()
        try? parser.setLanguage(language)
        let tree = parser.parse(source)
        return tree!
    }()

    var rootNode: Node { tree.rootNode! }

    func modelDebug() {
        var indent = ""
        walk { currentNode in
            if currentNode.childCount == 0 {
                print("\(indent)\(currentNode.nodeType!.trimmingCharacters(in: .whitespacesAndNewlines)) \(currentNode.pointRange) \(text(of: currentNode).trimmingCharacters(in: .whitespacesAndNewlines))")
            } else {
                print("\(indent)\(currentNode.nodeType!) \(currentNode.pointRange)")
            }
        } onDecend: {
            indent += " "
        } onAscend: {
            indent.removeLast()
        }
    }

    func walk(onNode: (Node) -> Void, onDecend: (()->Void)? = nil, onAscend: (()->Void)? = nil) {
        let cursor = rootNode.treeCursor
        while let currentNode = cursor.currentNode {
            onNode(currentNode)
            if cursor.goToFirstChild() {
                onDecend?()
            } else {
                while !cursor.gotoNextSibling() {
                    if cursor.gotoParent() {
                        onAscend?()
                    } else {
                        return
                    }
                }
            }
        }
    }

    func text(at range: TSRange) -> String {
        let buf: [UInt16] = Array(source.utf16)
        let hmm = buf[Int(range.bytes.lowerBound / 2) ..< Int(range.bytes.upperBound / 2)]
        return String(utf16CodeUnits: Array(hmm), count: hmm.count).trimmingCharacters(in: .whitespaces)
    }

    func text(of node: Node) -> String {
        text(at: node.tsRange)
    }
}

struct NodeChildren {
    let all: [Node]
    private let byType: [NodeType: [Node]]

    init(node: Node, verifyingTypes: [NodeType]) throws {
        var children = [Node]()
        var childrenByType = [NodeType: [Node]]()

        for child in (0 ..< node.childCount).compactMap(node.child(at:)).filter(\.isNamed) {
            let nodeType = try child.type()

            guard nodeType != .comment && nodeType != .tailComment else {
                continue
            }
            guard verifyingTypes.contains(nodeType) else {
                // TODO: Should throw located error, located on child, for both cases
                throw ModelParseError.unexpectedNodeType(type: nodeType.rawValue)
            }
            guard nodeType != .error else {
                throw ModelParseError.fileParseError
            }
            children.append(child)
            childrenByType[nodeType, default: []].append(child)
        }

        all = children
        byType = childrenByType
    }

    /// Returns the child node with a specific type.
    /// Throws if there is not exaclty one node of this type.
    func unique(_ type: NodeType) throws -> Node {
        let nodes = try byType[type] ?! ModelParseError.missingNodeChild
        if nodes.count > 1 { throw ModelParseError.duplicateUniqueNodeChildren(type: type.rawValue) }
        return try nodes.first ?! ModelParseError.missingNodeChild
    }

    /// Returns the child node with a specific type.
    /// Throws if there is more than one node of this type.
    func optional(_ type: NodeType) throws -> Node? {
        guard let nodes = byType[type] else { return nil }
        if nodes.count > 1 { throw ModelParseError.duplicateUniqueNodeChildren(type: type.rawValue) }
        return nodes.first
    }

    subscript(type: NodeType) -> [Node] {
        byType[type] ?? []
    }
}

enum NodeType: String {
    case file
    case tune
    case voice
    case header
    case field
    case body
    case bar
    case barline
    case cluster
    case note
    case comment
    case tailComment = "tail_comment"
    case error = "ERROR"
    case embellishment
    case duration
    case pitch
    case connector
    case fieldLabel = "field_label"
    case fieldValue = "field_value"
}

protocol NodeSourceTextProvider {
    func text(of: Node) -> String
}

extension Node {
    func text(from source: NodeSourceTextProvider) -> String { source.text(of: self) }

    func type() throws -> NodeType {
        guard let nodeTypeStr = nodeType else {
            throw ModelParseError.unexpectedNodeType(type: "nil")
        }
        guard let nodeType = NodeType(rawValue: nodeTypeStr) else {
            throw ModelParseError.unexpectedNodeType(type: nodeTypeStr)
        }
        return nodeType
    }

    func childrenVerifying(typeIs expectedType: NodeType, childrenAre expectedChildTypes: [NodeType]) throws -> NodeChildren {
        let type = try type()
        guard type == expectedType else {
            throw ModelParseError.unexpectedNodeType(type: type.rawValue)
        }
        return try NodeChildren(node: self, verifyingTypes: expectedChildTypes)
    }
}