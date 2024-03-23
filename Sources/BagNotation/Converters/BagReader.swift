//
//  BagReader.swift
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
        let docModeler = try DocModeler(node: tree.rootNode!, textSource: self)
        // docFlow is essentially ignored
        let docFlow = FlowContext(timeSignature: .time44, noteLength: .eighth, previousPitch: .e, tempo: nil, variation: .none)
        let docContext = DocContextBody(tuneCount: docModeler.tuneModelers.count)
        _ = try docModeler.provideContext(head: docFlow, body: docContext)
        return docModeler.model()
    }

    private func text(at range: TSRange) -> String {
        let buf: [UInt16] = Array(source.utf16)
        let hmm = buf[Int(range.bytes.lowerBound / 2) ..< Int(range.bytes.upperBound / 2)]
        return String(utf16CodeUnits: Array(hmm), count: hmm.count).trimmingCharacters(in: .whitespaces)
    }

    func text(of node: Node) -> String {
        text(at: node.tsRange)
    }
}

// MARK: Modeling helpers

private struct NodeChildren {
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

private enum NodeType: String {
    case file
    case tune
    case line
    case header
    case field
    case body
    case measure
    case barline
    case cluster = "note_cluster"
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

private protocol NodeSourceTextProvider {
    func text(of: Node) -> String
}

private protocol LeafModeler {
    associatedtype Output

    // TODO: would be a great to have a better way to wrap these, instead of the extra argument
    // can using "where" help? like init(collection: T) where T.Element == String {
    // or just using differently named existing parameters
    init(node: Node, textSource: NodeSourceTextProvider) throws
    init(node: Node, textSource: NodeSourceTextProvider, impl: Bool) throws

    func model() -> Output
}

extension LeafModeler {
    init(node: Node, textSource: NodeSourceTextProvider) throws {
        do { try self.init(node: node, textSource: textSource, impl: true) }
        catch let error as ModelParseError {
            let loc = node.pointRange
            let locError = LocatedModelParseError(base: error, location: "line \(loc.lowerBound.row + 1) col \((loc.lowerBound.column / 2) + 1)")
            locError.log()
            throw locError
        }
    }
}

private protocol Modeler: LeafModeler {
    associatedtype OutputContext

    var node: Node { get }
    var textSource: any NodeSourceTextProvider { get }

    func provideContext(head: FlowContext, body: OutputContext) throws -> FlowContext
    func provideContextImpl(head: FlowContext, body: OutputContext) throws -> FlowContext
}

extension Modeler {
    func provideContext(head: FlowContext, body: OutputContext) throws -> FlowContext {
        do { return try provideContextImpl(head: head, body: body) }
        catch let error as ModelParseError {
            let loc = node.pointRange
            let locError = LocatedModelParseError(base: error, location: "line \(loc.lowerBound.row + 1) col \((loc.lowerBound.column / 2) + 1)")
            locError.log()
            throw locError
        }
    }
}

private extension Node {
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

// MARK: - Modelers

private final class DocModeler: Modeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let tuneModelers: [TuneModeler]

    var context: DocContext!

    init(node: Node, textSource: any NodeSourceTextProvider, impl _: Bool) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .file, childrenAre: [.tune])

        tuneModelers = try children[.tune].map {
            try TuneModeler(node: $0, textSource: textSource)
        }
    }

    func provideContextImpl(head: FlowContext, body: DocContextBody) throws -> FlowContext {
        var flow = head

        for (idx, tm) in tuneModelers.enumerated() {
            let tuneContext = TuneContextBody(tuneNumber: idx + 1, lineCount: tm.voiceModelersByLine.count)
            let headerFlow = FlowContext(timeSignature: tm.header.timeSignature,
                                         noteLength: tm.header.noteLength,
                                         previousPitch: .e,
                                         tempo: tm.header.tempo,
                                         variation: .none)
            flow = try tm.provideContext(head: headerFlow, body: tuneContext)
        }

        context = DocContext(head: head, body: body, tail: flow)
        return flow
    }

    func model() -> Doc {
        Doc(context: context, tunes: tuneModelers.map { $0.model() })
    }
}

private final class TuneModeler: Modeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let header: Header
    let voiceModelersByLine: [[VoiceModeler]]

    var context: TuneContext!
    var lineContexts = [LineContext]()

    init(node: Node, textSource: any NodeSourceTextProvider, impl _: Bool) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .tune, childrenAre: [.line, .header])
        header = try HeaderModeler(node: children.unique(.header), textSource: textSource).model()

        let voiceModelers = try children[.line].map {
            try VoiceModeler(node: $0, textSource: textSource)
        }

        var voiceModelersByLine = [[VoiceModeler]]()
        var voicesInLine = [VoiceModeler]()
        for voiceModeler in voiceModelers {
            if !voiceModeler.isHarmony && !voicesInLine.isEmpty {
                voiceModelersByLine.append(voicesInLine)
                voicesInLine.removeAll()
            }
            voicesInLine.append(voiceModeler)
        }
        if !voicesInLine.isEmpty {
            voiceModelersByLine.append(voicesInLine)
        }
        self.voiceModelersByLine = voiceModelersByLine
    }

    func provideContextImpl(head: FlowContext, body: TuneContextBody) throws -> FlowContext {
        var flow = head
        // TODO: split flow per voice

        for (lineIdx, lineVoices) in voiceModelersByLine.enumerated() {
            let lineBody = LineContextBody(tune: body, lineNumber: lineIdx + 1, voiceCount: lineVoices.count)
            let lineHead = flow
            for (voiceIdx, voiceModeler) in lineVoices.enumerated() {
                let voiceBody = VoiceContextBody(line: lineBody, voiceNumber: voiceIdx, barCount: voiceModeler.barModelers.count)
                flow = try voiceModeler.provideContext(head: flow, body: voiceBody)
            }
            lineContexts.append(LineContext(head: lineHead, body: lineBody, tail: flow))
        }

        context = TuneContext(head: head, body: body, tail: flow)
        return flow
        // TODO: update grammar to match this terminology (voice vs line)
        // TODO: rename measure to bar in grammar
        // and note_clusters
        // and tie to connector
    }

    func model() -> Tune {
        let lines = zip(voiceModelersByLine, lineContexts).map { lineVoices, lineContext in
            let voices = lineVoices.map { $0.model() }
            return Line(context: lineContext, voices: voices)
        }

        return Tune(context: context, header: header, lines: lines)
    }
}

private final class HeaderModeler: LeafModeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let header: Header

    init(node: Node, textSource: any NodeSourceTextProvider, impl _: Bool) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .header, childrenAre: [.field])

        let fields = try children[.field].map { try FieldModeler(node: $0, textSource: textSource).model() }.uniqueByLabel()

        guard let titleField = fields[.title] else { throw ModelParseError.missingTuneTitle }
        guard let styleField = fields[.style] else { throw ModelParseError.missingTuneStyle }

        let (title, byline) = titleField.asTitle()
        let possibleComposers = [fields[.composer]?.value, byline, fields[.trad] != nil ? "trad" : nil].compactMap { $0 }

        guard possibleComposers.count <= 1 else { throw ModelParseError.duplicateComposers }

        let style = try styleField.asStyle()

        header = Header(
            title: title,
            style: style,
            composer: try possibleComposers.first ?! ModelParseError.missingTuneComposer,
            noteLength: (try? fields[.note]?.asDuration()) ?? Duration.eighth,
            timeSignature: try (try? fields[.time]?.asTimeSignature()) ?? style.impliedTimeSignature ?! ModelParseError.missingTuneTimeSignature,
            tempo: try fields[.tempo]?.asTempo())
    }

    func model() -> Header { header }
}

private final class FieldModeler: LeafModeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let field: Field

    init(node: Node, textSource: any NodeSourceTextProvider, impl _: Bool) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .field, childrenAre: [.fieldLabel, .fieldValue])

        let label = try children.unique(.fieldLabel).text(from: textSource)
        let value = try children.optional(.fieldValue)?.text(from: textSource)
        field = try Field(label: label, value: value)
    }

    func model() -> Field { field }
}

private final class VoiceModeler: Modeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let leadingBarline: Barline?
    let leadingField: Field?
    let barModelers: [BarModeler]

    var context: VoiceContext!
    var isHarmony: Bool { leadingField?.label == .h }

    init(node: Node, textSource: any NodeSourceTextProvider, impl _: Bool) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .line, childrenAre: [.barline, .measure, .field])

        if let barline = try children.optional(.barline)?.text(from: textSource).toBarline() {
            leadingBarline = barline == .double ? .partStart : barline
        } else { leadingBarline = nil }

        if let fieldNode = try children.optional(.field) {
            let field = try FieldModeler(node: fieldNode, textSource: textSource).model()
            leadingField = field
            if field.label != .h && field.label != .v {
                throw ModelParseError.unexpectedField(label: field.label)
            }
        } else {
            leadingField = nil
        }

        barModelers = try children[.measure].map {
            try BarModeler(node: $0, textSource: textSource)
        }
    }

    func provideContextImpl(head: FlowContext, body: VoiceContextBody) throws -> FlowContext {
        var flow = FlowContext(from: head, variation: leadingField?.label == .v ? leadingField!.asVariation() : nil)

        for (idx, barModeler) in barModelers.enumerated() {
            let barBody = BarContextBody(voice: body, barNumber: idx + 1, clusterCount: barModeler.clusterModelers.count)
            flow = try barModeler.provideContext(head: flow, body: barBody)
        }
        context = VoiceContext(head: head, body: body, tail: flow)
        return flow
    }

    func model() -> Voice {
        let bars = barModelers.map { $0.model() }
        return Voice(context: context, isHarmony: isHarmony, bars: bars, leadingBarline: leadingBarline)
    }
}

private final class BarModeler: Modeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    var barline: Barline
    var clusterModelers = [ClusterModeler]()
    var fieldsByClusterIndex = [Int: Field]()

    var context: BarContext!

    init(node: Node, textSource: any NodeSourceTextProvider, impl _: Bool) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .measure, childrenAre: [.cluster, .barline, .field])

        barline = try children.unique(.barline).text(from: textSource).toBarline()

        for child in children.all {
            switch try child.type() {
            case .barline:
                break
            case .cluster:
                let clusterModeler = try ClusterModeler(node: child, textSource: textSource)
                clusterModelers.append(clusterModeler)
            case .field:
                let field = try FieldModeler(node: child, textSource: textSource).model()
                // TODO: handle multiple fields between clusters
                fieldsByClusterIndex[clusterModelers.count] = field
            default: throw ModelParseError.unexpectedNodeType(type: child.nodeType!)
            }
        }
    }

    func provideContextImpl(head: FlowContext, body: BarContextBody) throws -> FlowContext {
        var flow = head

        for (idx, clusterModeler) in clusterModelers.enumerated() {
            if let field = fieldsByClusterIndex[idx] {
                switch field.label {
                case .time: flow = FlowContext(from: flow, timeSignature: try field.asTimeSignature())
                case .note: flow = FlowContext(from: flow, noteLength: try field.asDuration())
                case .v: flow = FlowContext(from: flow, variation: field.asVariation())
                case .tempo: flow = FlowContext(from: flow, tempo: try field.asTempo())
                default: throw ModelParseError.unexpectedField(label: field.label)
                }
            }

            let clusterBody = ClusterContextBody(bar: body, clusterNumber: idx + 1)
            flow = try clusterModeler.provideContext(head: flow, body: clusterBody)
        }

        context = BarContext(head: head, body: body, tail: flow)
        return flow
    }

    func model() -> Bar {
        let clusters = clusterModelers.map { $0.model() }
        return Bar(context: context, clusters: clusters, trailingBarline: barline)
    }
}

private final class ClusterModeler: Modeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let noteModelers: [NoteModeler]

    var context: ClusterContext!

    init(node: Node, textSource: any NodeSourceTextProvider, impl _: Bool) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .cluster, childrenAre: [.note])

        noteModelers = try children[.note].map {
            try NoteModeler(node: $0, textSource: textSource)
        }
    }

    func provideContextImpl(head: FlowContext, body: ClusterContextBody) throws -> FlowContext {
        var flow = head

        var tupletSizes = [Int]()
        var tupletSize = 0
        for nm in noteModelers {
            if nm.continuesTuplet {
                tupletSize += 1
            } else if tupletSize > 0 {
                tupletSizes.append(tupletSize + 1)
                tupletSize = 0
            }
        }

        var tupletSizeIndex = 0
        var tupletPosition = 0

        for (_, nm) in noteModelers.enumerated() {
            if nm.continuesTuplet || tupletPosition > 0 {
                tupletPosition += 1
            }

            let noteBody = NoteContextBody(cluster: body,
                                           tupletSize: tupletPosition == 0 ? 0 : tupletSizes[tupletSizeIndex],
                                           tupletNumber: tupletPosition)
            flow = try nm.provideContext(head: flow, body: noteBody)

            if tupletPosition != 0 && !nm.continuesTuplet {
                tupletPosition = 0
                tupletSizeIndex += 1
            }
        }
        context = ClusterContext(head: head, body: body, tail: flow)
        return flow
    }

    func model() -> Cluster {
        let notes = noteModelers.map { $0.model() }
        return Cluster(context: context, notes: notes)
    }
}

private final class NoteModeler: Modeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let pitch: Pitch

    let tied: Bool
    let continuesTuplet: Bool
    let slurred: Bool

    fileprivate let children: NodeChildren

    var embellishment: Embellishment?
    var duration: Duration!
    var context: NoteContext!

    init(node: Node, textSource: any NodeSourceTextProvider, impl _: Bool) throws {
        self.node = node
        self.textSource = textSource

        children = try node.childrenVerifying(typeIs: .note, childrenAre: [.embellishment, .pitch, .duration, .tie])

        pitch = try children.unique(.pitch).text(from: textSource).toPitch()

        let connector = try children.optional(.tie)?.text(from: textSource)
        tied = connector == "_"
        continuesTuplet = connector == "-"
        slurred = connector == "~"
    }

    func provideContextImpl(head: FlowContext, body: NoteContextBody) throws -> FlowContext {
        embellishment = if let embellishmentStr = try children.optional(.embellishment)?.text(from: textSource) {
            try Embellishment(string: embellishmentStr, from: head.previousPitch, on: pitch)
        } else { nil }

        duration = try children.optional(.duration)?.text(from: textSource).toDuration(modifying: head.noteLength) ?? head.noteLength

        context = NoteContext(head: head, body: body, tail: FlowContext(from: head, previousPitch: pitch))
        return context.tail
    }

    func model() -> Note {
        Note(context: context,
             pitch: pitch,
             embellishment: embellishment,
             duration: duration,
             tied: tied,
             slurred: slurred)
    }
}
