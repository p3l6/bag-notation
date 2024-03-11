//
//  ModelBuilder.swift
//  Bag Notation
//

import SwiftTreeSitter
import TreeSitterBagNotation

public class BagReader: NodeSourceTextProvider {
    let source: String
    public init(_ source: String) { self.source = source }

    lazy var tree: Tree = {
        let language = Language(language: tree_sitter_BagNotation())
        let parser = Parser()
        try? parser.setLanguage(language)
        let tree = parser.parse(source)
        return tree!
    }()

    private func modelDebug(from node: Node) {
        let cur = node.treeCursor
        var indent = ""
        while let currentNode = cur.currentNode {
            if currentNode.childCount == 0 {
                print("\(indent)\(currentNode.nodeType!.trimmingCharacters(in: .whitespacesAndNewlines)) \(currentNode.pointRange) \(text(of: currentNode).trimmingCharacters(in: .whitespacesAndNewlines))")
            } else {
                print("\(indent)\(currentNode.nodeType!) \(currentNode.pointRange)")
            }
            if cur.goToFirstChild() {
                indent += " "
            } else {
                while !cur.gotoNextSibling() {
                    if cur.gotoParent() {
                        indent.removeLast()
                    } else {
                        return
                    }
                }
            }
        }
    }

    public func makeModel() throws -> Doc {
        // modelDebug(from: tree.rootNode!)
        return try DocModeler(node: tree.rootNode!, context: Context(), textSource: self).model()
    }

    private func text(at range: TSRange) -> String {
        let buf: [UInt16] = Array(source.utf16)
        let hmm = buf[Int(range.bytes.lowerBound / 2) ..< Int(range.bytes.upperBound / 2)]
        return String(utf16CodeUnits: Array(hmm), count: hmm.count).trimmingCharacters(in: .whitespaces)
    }

    func text(of node: Node) -> String {
        text(at: node.tsRange)
    }

    // // // plan!

    // fix other todos

    // commit checkpoint

    // split NoteContext, linecontext, tuneContext (basically replaces header)
    // all contain the previous level. defined in the respective files.

    // add preceding note to note context

    // commit checkpoint

    // back to implementing tuplets
    // then do slurs to round it out?
}


class DocModeler: Modeler<Doc> {
    override var expectedNodeType: NodeType { .file }
    override var expectedChildNodeTypes: [NodeType] { [.tune] }

    override func modelerImplementation() throws -> Doc {
        return Doc(tunes: try children.byType[.tune]!.map {
            continuationContext.tuneNumber += 1
         return   try TuneModeler(node: $0, context: continuationContext, textSource: textSource).model()
        })
    }
}

class TuneModeler: Modeler<Tune> {
    override var expectedNodeType: NodeType { .tune }
    override var expectedChildNodeTypes: [NodeType] { [.line, .header] }

    override func modelerImplementation() throws -> Tune {
        continuationContext.lineNumberInTune = 0


        let header = try HeaderModeler(node: children.uniqueNode(for: .header), context: context, textSource: textSource).model()
        continuationContext.timeSignature = header.timeSignature
        continuationContext.noteLength = header.noteLength

        var lines  = [Line]()
        var voicesInLine  = [Line.Voice]()

        for child in children.all {
            switch NodeType(rawValue: child.nodeType!)! { // TODO: helper
            case .header:
                break
            case .line:
                continuationContext.barNumberInLine = 0

                // TODO: maybe update grammar to match this terminology
                continuationContext.voiceNumber += 1
                let voice = try VoiceModeler(node: child, context: continuationContext, textSource: textSource).model()
                continuationContext = voice.context
                if !voice.isHarmony && !voicesInLine.isEmpty {
                    continuationContext.lineNumberInTune += 1
                    lines.append(Line(context: continuationContext, voices: voicesInLine))
                    voicesInLine.removeAll()
                }
                voicesInLine.append(voice)




            default: throw ModelParseError.unexpectedNodeType(type: child.nodeType!)
            }
        }
        if !voicesInLine.isEmpty {
            continuationContext.lineNumberInTune += 1
            lines.append(Line(context: continuationContext, voices: voicesInLine))
        }

        return Tune(header: header, lines: lines)
    }
}

class HeaderModeler: Modeler<Header> {
    override var expectedNodeType: NodeType { .header }
    override var expectedChildNodeTypes: [NodeType] { [.field] }

    override func modelerImplementation() throws -> Header {
        let fields = try children.byType[.field]!.map{try fieldModeler(node: $0, context: context, textSource: textSource).model()}.uniqueByLabel()

        guard let titleField = fields[.title] else { throw ModelParseError.tuneMissingTitle }
        guard let styleField = fields[.style] else { throw ModelParseError.tuneMissingStyle }

        let (title, byline) = titleField.asTitle()
        let possibleComposers = [fields[.composer]?.value, byline, fields[.trad] != nil ? "trad" : nil].compactMap { $0 }

        guard possibleComposers.count <= 1 else { throw ModelParseError.duplicateComposers }

        let style = try styleField.asStyle()

        return Header(
            context: context,
            title: title,
            style: style,
            composer: try possibleComposers.first ?! ModelParseError.tuneMissingComposer,
            noteLength: (try? fields[.note]?.asDuration()) ?? Duration.eighth,
            timeSignature:  try (try? fields[.time]?.asTimeSignature()) ?? style.impliedTimeSignature ?! ModelParseError.tuneMissingTimeSignature,
            tempo: try fields[.tempo]?.asTempo()
        )
    }
}


class VoiceModeler: Modeler<Line.Voice> {
    override var expectedNodeType: NodeType { .line }
    override var expectedChildNodeTypes: [NodeType] { [.barline, .measure, .field] }

    override func modelerImplementation() throws -> Line.Voice {
        let leadingBarline = try children.optionalNode(for: .barline)?.text(from: textSource).toBarline(in: context)

        continuationContext.barNumberInLine = 0
        continuationContext.barCountInLine = children.byType[.measure]!.count // TODO: rename measure to bar in grammar
        // TODO:  bytype returns empty when accessed



        var bars = [Bar]()
        var isHarmony = false

        for child in children.all {
            switch NodeType(rawValue: child.nodeType!)! { // TODO: helper
            case .barline:
                break
            case .measure:
                continuationContext.barNumberInLine += 1
                let bar = try BarModeler(node: child, context: continuationContext, textSource: textSource).model()
                continuationContext = bar.context
                bars.append(bar)
            case .field:
                let field = try fieldModeler(node: child, context: context, textSource: textSource).model()
                switch field.label {
                case .h: isHarmony = true
                default: break // TODO: throw
                }
            default: throw ModelParseError.unexpectedNodeType(type: child.nodeType!)
            }
        }

        if !isHarmony { continuationContext.voiceNumber = 0 }

        return Line.Voice(context: continuationContext, isHarmony: isHarmony, bars: bars, leadingBarline: leadingBarline)

    }
}


class BarModeler: Modeler<Bar> {
    override var expectedNodeType: NodeType { .measure }
    override var expectedChildNodeTypes: [NodeType] { [.noteCluster, .barline, .field] }

    override func modelerImplementation() throws -> Bar {
        let barline = try children.uniqueNode(for: .barline).text(from: textSource).toBarline(in: context)
        var clusters = [[Note]]()

        for child in children.all {
            switch NodeType(rawValue: child.nodeType!)! { // TODO: helper
            case .barline: 
                break
            case .noteCluster:
                try clusters.append(NoteClusterModeler(node: child, context: continuationContext, textSource: textSource).model())
            case .field:
                let field = try fieldModeler(node: child, context: context, textSource: textSource).model()
                switch field.label {
                // TODO: better name for continuationContext
                case .time: continuationContext.timeSignature = try field.asTimeSignature() ?! ModelParseError.invalidTimeSignature
                case .note: continuationContext.noteLength = try field.asDuration() ?! ModelParseError.invalidNoteLength
                case .v: continuationContext.variation = field.asVariation()
                case .tempo: continuationContext.tempo = try field.asTempo()
                default: break
                }
            default: throw ModelParseError.unexpectedNodeType(type: child.nodeType!)
            }
        }

        return Bar(context: continuationContext, noteClusters: clusters, trailingBarline: barline)
    }
}

class fieldModeler: Modeler<Field> {
    override var expectedNodeType: NodeType { .field }
    override var expectedChildNodeTypes: [NodeType] { [.fieldLabel, .fieldValue] }

    override func modelerImplementation() throws -> Field {
        let label = try children.uniqueNode(for: .fieldLabel).text(from: textSource)
        let value = try children.optionalNode(for: .fieldValue)?.text(from: textSource)
        return try Field(label: label, value: value)
    }
}


private struct NodeChildren {
    let all: [Node]
    let byType: [NodeType: [Node]]

    init(node: Node, verifyingTypes: [NodeType]) throws {
        var children = [Node]()
        var childrenByType = [NodeType: [Node]]()

        for child in (0 ..< node.childCount).compactMap(node.child(at:)).filter(\.isNamed) {
            guard let nodeTypeStr = child.nodeType else {
                throw ModelParseError.unknownNodeType(type: "nil")
            }
            guard let nodeType = NodeType(rawValue: nodeTypeStr) else {
                throw ModelParseError.unknownNodeType(type: nodeTypeStr)
            }
            guard nodeType != .comment && nodeType != .tailComment else {
                continue
            }
            guard verifyingTypes.contains(nodeType) else {
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
    func uniqueNode(for type: NodeType) throws -> Node {
        // TODO: throw more than one
        return try byType[type]?.first ?! ModelParseError.nodeMissingChild
    }

    /// Returns the child node with a specific type.
    /// Throws if there is more than one node of this type.
    func optionalNode(for type: NodeType) throws -> Node? {
        // TODO: throw more than one
        // and change name, remove node and arg label
        return byType[type]?.first
    }
    // TODO:  write an [] operator or field types, make private property
}


enum NodeType: String {
    case file
    case tune
    case line
    case header
    case field
    case body
    case measure
    case barline
    case noteCluster = "note_cluster"
    case note
    case comment
    case tailComment = "tail_comment"
    case error = "ERROR"
    case embellishment
    case duration
    case pitch
    case tie
    case fieldLabel = "field_label"
    case fieldValue = "field_value"
}

protocol NodeSourceTextProvider {
    func text(of: Node) -> String
}

class Modeler<Output> {
    let node: Node
    let context: Context
    var continuationContext: Context
    let textSource: NodeSourceTextProvider
    var expectedNodeType: NodeType { .error }
    var expectedChildNodeTypes: [NodeType] { [.error] }
    fileprivate var children: NodeChildren!

    init(node: Node, context: Context, textSource: NodeSourceTextProvider) throws {
        self.node = node;
        self.context = context
        self.continuationContext = context
        self.textSource = textSource
    }

    final func model() throws -> Output {
        do {
            children = try NodeChildren(node: node, verifyingTypes: expectedChildNodeTypes)

            guard let nodeType = NodeType(rawValue: node.nodeType!), nodeType  == expectedNodeType else {
                throw ModelParseError.unexpectedNodeType(type: node.nodeType!)
            }

            return try modelerImplementation()
        } catch let error as ModelParseError {
            let loc = node.pointRange
            let locError = LocatedModelParseError(base: error, location: "line \(loc.lowerBound.row + 1) col \((loc.lowerBound.column / 2) + 1)")
            locError.log()
            throw locError
        }
    }

    fileprivate func modelerImplementation() throws -> Output { throw ModelParseError.invalidField } // TODO: new error type
}


extension Node {
    func text(from source: NodeSourceTextProvider) -> String { source.text(of: self) }
}

// TODO: move these to respective files
extension String {
    func toPitch() throws -> Pitch { try Pitch.from(string: self) }
    func toEmbellishment() throws -> Embellishment { try Embellishment.from(string: self) }
    func toDuration(modifying base: Duration) throws -> Duration { try base.modified(by: self) }
    func toBarline(in context: Context) throws -> Barline { try Barline(rawValue: self, context: context) ?! ModelParseError.invalidBarline }
}

class NoteClusterModeler: Modeler<[Note]> {
    override var expectedNodeType: NodeType { .noteCluster }
    override var expectedChildNodeTypes: [NodeType] { [.note] }

    override func modelerImplementation() throws -> [Note] {
        let notes = try children.byType[.note , default:[]].map {
            try NoteModeler(node: $0, context: context, textSource: textSource).model()
        }
        return notes
    }
}

class NoteModeler: Modeler<Note> {
    override var expectedNodeType: NodeType { .note }
    override var expectedChildNodeTypes: [NodeType] { [.embellishment, .pitch, .duration, .tie] }

    override func modelerImplementation() throws -> Note {
        let pitch = try children.uniqueNode(for: .pitch).text(from: textSource).toPitch()
        let embellishment = try children.optionalNode(for: .embellishment)?.text(from: textSource).toEmbellishment()
        let duration = try children.optionalNode(for: .duration)?.text(from: textSource).toDuration(modifying: context.noteLength) ?? context.noteLength

        if let embellishment { _ = try pitch.gracenotes(for: embellishment) }

        let note = Note(context: context,
                        pitch: pitch,
                        embellishment: embellishment,
                        duration: duration,
                        tied: try children.optionalNode(for: .tie) != nil)

        return note
    }
}
