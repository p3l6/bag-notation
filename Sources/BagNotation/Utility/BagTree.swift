//
//  BagTree.swift
//  Bag Notation
//

import SwiftTreeSitter
import TreeSitterBagNotation

public class BagTree: NodeSourceTextProvider {
    let source: String
    let config: LanguageConfiguration
    let sourceLines: [String.SubSequence]

    public init(_ source: String) {
        self.source = source
        sourceLines = source.split(separator: "\n", omittingEmptySubsequences: false)
        config = try! LanguageConfiguration(tree_sitter_BagNotation(), name: "BagNotation", bundleName: "Bag Notation_TreeSitterBagNotation")
    }

    lazy var tree: Tree = {
        let parser = Parser()
        try? parser.setLanguage(config.language)
        let tree = parser.parse(source)
        return tree!.copy()!
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

    func executeQuery(_ queryString: String) throws -> QueryCursor {
        let query = try Query(language: config.language, data: queryString.data(using: .utf8)!)
        return query.execute(in: tree)
    }

    func stringIndexes(for range: InlineRange) -> Range<String.Index> {
        let line = sourceLines[range.line]
        return line.index(line.startIndex, offsetBy: range.lowerBound) ..< line.index(line.startIndex, offsetBy: range.upperBound)
    }

    func text(for range: InlineRange) -> String {
        return String(source[stringIndexes(for: range)])
    }

    func text(of node: Node) -> String {
        return String(source[stringIndexes(for: node.inlineRange)])
    }
}

/// Like `Range<Point>`, except:
/// - The range exists on a single line
/// - The bounds are in reference to characters, not bytes
struct InlineRange {
    let line: Int
    let lowerBound: Int
    let upperBound: Int

    var width: Int { upperBound - lowerBound }

    func rangeFor(relativeRange insideRange: Range<Int>) -> InlineRange {
        InlineRange(line: line, lowerBound: lowerBound + insideRange.lowerBound, upperBound: lowerBound + insideRange.upperBound)
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
    case shorthandLabel = "shorthand_label"
}

protocol NodeSourceTextProvider {
    func stringIndexes(for: InlineRange) -> Range<String.Index>
    func text(for range: InlineRange) -> String
    func text(of: Node) -> String
}

extension Node {
    var inlineRange: InlineRange {
    // TODO: guard that this node is on a single line
        InlineRange(line: Int(pointRange.lowerBound.row),
                    lowerBound: Int(pointRange.lowerBound.column)/2,
                    upperBound: Int(pointRange.upperBound.column)/2)
    }

    func trimmedText(from source: NodeSourceTextProvider) -> String { source.text(of: self).trimmingCharacters(in: .whitespacesAndNewlines) }

    func type() throws -> NodeType {
        guard let nodeTypeStr = nodeType else {
            throw ModelParseError.unexpectedNodeType(type: "nil")
        }
        guard let nodeType = NodeType(rawValue: nodeTypeStr) else {
            throw ModelParseError.unexpectedNodeType(type: nodeTypeStr)
        }
        return nodeType
    }

    func verify(typeIs expectedType: NodeType) throws {
        let type = try type()
        guard type == expectedType else {
            throw ModelParseError.unexpectedNodeType(type: type.rawValue)
        }
    }

    func childrenVerifying(typeIs expectedType: NodeType, childrenAre expectedChildTypes: [NodeType]) throws -> NodeChildren {
        try verify(typeIs: expectedType)
        return try NodeChildren(node: self, verifyingTypes: expectedChildTypes)
    }
}
