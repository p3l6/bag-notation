//
//  BagReader.swift
//  Bag Notation
//

import SwiftTreeSitter

public class BagReader {
    let tree: BagTree

    public init(_ source: String) { tree = BagTree(source) }

    public func makeModel() throws -> Doc {
        // tree.modelDebug()
        let docModeler = try DocModeler(node: tree.rootNode, textSource: tree)
        // docFlow is essentially ignored
        let docFlow = FlowContext(timeSignature: .time44, noteLength: .eighth, tempo: nil)
        let docContext = DocContextBody(tuneCount: docModeler.tuneModelers.count)
        _ = try docModeler.provideContext(head: docFlow, body: docContext)
        return docModeler.model()
    }
}

// MARK: Modeling protocols

private protocol LeafModeler {
    associatedtype Output

    init(node: Node, textSource: NodeSourceTextProvider) throws
    init(private node: Node, textSource: NodeSourceTextProvider) throws

    func model() -> Output
}

extension LeafModeler {
    init(node: Node, textSource: NodeSourceTextProvider) throws {
        do { try self.init(private: node, textSource: textSource) }
        catch let error as ModelParseError {
            let locError = LocatedModelParseError(base: error, location: node.inlineRange)
            throw locError
        }
    }
}

private protocol Modeler: LeafModeler {
    associatedtype OutputContext

    var node: Node { get }
    var textSource: any NodeSourceTextProvider { get }

    func provideContext(head: FlowContext, body: OutputContext) throws -> FlowContext
    func provideContext(private head: FlowContext, body: OutputContext) throws -> FlowContext
}

extension Modeler {
    func provideContext(head: FlowContext, body: OutputContext) throws -> FlowContext {
        do { return try provideContext(private: head, body: body) }
        catch let error as ModelParseError {
            let locError = LocatedModelParseError(base: error, location: node.inlineRange)
            throw locError
        }
    }
}

// MARK: - Modelers

private final class DocModeler: Modeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let tuneModelers: [TuneModeler]

    var context: DocContext!

    init(private node: Node, textSource: any NodeSourceTextProvider) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .file, childrenAre: [.tune])

        tuneModelers = try children[.tune].map {
            try TuneModeler(node: $0, textSource: textSource)
        }
    }

    func provideContext(private head: FlowContext, body: DocContextBody) throws -> FlowContext {
        var flow = head

        for (idx, tm) in tuneModelers.enumerated() {
            let tuneContext = TuneContextBody(tuneNumber: idx + 1, lineCount: tm.voiceModelersByLine.count)
            let headerFlow = FlowContext(timeSignature: tm.header.timeSignature,
                                         noteLength: tm.header.noteLength,
                                         tempo: tm.header.tempo)
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

    init(private node: Node, textSource: any NodeSourceTextProvider) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .tune, childrenAre: [.voice, .header])
        header = try HeaderModeler(node: children.unique(.header), textSource: textSource).model()

        let voiceModelers = try children[.voice].map {
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

    func provideContext(private head: FlowContext, body: TuneContextBody) throws -> FlowContext {
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

    init(private node: Node, textSource: any NodeSourceTextProvider) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .header, childrenAre: [.field])

        let fields = try children[.field].map { try FieldModeler(node: $0, textSource: textSource).model() }.uniqueByLabel()

        guard let titleField = fields[.title] else { throw ModelParseError.missingTuneTitle }
        guard let styleField = fields[.style] else { throw ModelParseError.missingTuneStyle }

        let possibleComposers = [fields[.by]?.value, fields[.trad] != nil ? "trad" : nil].compactMap { $0 }

        guard possibleComposers.count <= 1 else { throw ModelParseError.duplicateComposers }

        let style = try styleField.value.toTuneStyle()

        header = Header(
            title: titleField.value,
            style: style,
            composer: try possibleComposers.first ?! ModelParseError.missingTuneComposer,
            arranger: fields[.arr]?.value,
            noteLength: (try? fields[.note]?.asDuration()) ?? Duration.eighth,
            timeSignature: try fields[.time]?.value.toTimeSignature() ?? style.impliedTimeSignature ?! ModelParseError.missingTuneTimeSignature,
            tempo: try fields[.tempo]?.asTempo(),
            revision: fields[.rev]?.value,
            forceNewPage: fields[.newpage] != nil)
    }

    func model() -> Header { header }
}

private final class FieldModeler: LeafModeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let field: Field

    init(private node: Node, textSource: any NodeSourceTextProvider) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .field, childrenAre: [.fieldLabel, .fieldValue, .shorthandLabel])

        if let shorthand = try children.optional(.shorthandLabel)?.trimmedText(from: textSource) {
            field = try Field(shorthand: shorthand)
        } else {
            let label = try children.unique(.fieldLabel).trimmedText(from: textSource)
            let value = try children.optional(.fieldValue)?.trimmedText(from: textSource)
            field = try Field(label: label, value: value)
        }
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

    init(private node: Node, textSource: any NodeSourceTextProvider) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .voice, childrenAre: [.barline, .bar, .field])

        if let barline = try children.optional(.barline)?.trimmedText(from: textSource).toBarline() {
            leadingBarline = barline == .double ? .partStart : barline
        } else { leadingBarline = nil }

        if let fieldNode = try children.optional(.field) {
            let field = try FieldModeler(node: fieldNode, textSource: textSource).model()
            leadingField = field
        } else {
            leadingField = nil
        }

        barModelers = try children[.bar].map {
            try BarModeler(node: $0, textSource: textSource)
        }
    }

    func provideContext(private head: FlowContext, body: VoiceContextBody) throws -> FlowContext {
        var flow = if let leadingField, leadingField.label != .h {
            try leadingField.reflow(context: head)
        } else {
            head
        }

        for (idx, barModeler) in barModelers.enumerated() {
            let barBody = BarContextBody(voice: body, barNumber: idx + 1, clusterCount: barModeler.clusterModelers.count)
            flow = try barModeler.provideContext(head: flow, body: barBody)
        }

        if flow.variation != .none {
            flow = FlowContext(from: flow, variation: Variation.none)
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

    enum BarElement {
        case cluster(modeler: ClusterModeler)
        case field(field: Field)
        case rest(modeler: RestModeler)
    }

    var elements = [BarElement]()
    var clusterModelers: [ClusterModeler] {
        elements.compactMap { if case let .cluster(modeler) = $0 { modeler } else { nil } }
    }

    var context: BarContext!

    init(private node: Node, textSource: any NodeSourceTextProvider) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .bar, childrenAre: [.cluster, .barline, .field])

        barline = try children.unique(.barline).trimmedText(from: textSource).toBarline()

        for child in children.all {
            switch try child.type() {
            case .barline:
                break
            case .cluster:
                let clusterModeler = try ClusterModeler(node: child, textSource: textSource)
                elements.append(.cluster(modeler: clusterModeler))
            case .field:
                let field = try FieldModeler(node: child, textSource: textSource).model()
                if field.label == .rest || field.label == .spacer {
                    elements.append(.rest(modeler: try RestModeler(node: child, textSource: textSource)))
                } else {
                    elements.append(.field(field: field))
                }
            default: throw ModelParseError.unexpectedNodeType(type: child.nodeType!)
            }
        }
    }

    func provideContext(private head: FlowContext, body: BarContextBody) throws -> FlowContext {
        var flow = head
        var number = 0

        for element in elements {
            switch element {
            case let .field(field):
                flow = try field.reflow(context: flow)
            case let .rest(modeler):
                flow = try modeler.provideContext(head: flow, body: ())
            case let .cluster(modeler):
                number += 1
                let clusterBody = ClusterContextBody(bar: body, clusterNumber: number)
                flow = try modeler.provideContext(head: flow, body: clusterBody)
            }
        }

        context = BarContext(head: head, body: body, tail: flow)
        return flow
    }

    func model() -> Bar {
        let contents = elements.compactMap { element in
            switch element {
            case let .cluster(modeler): Bar.BarContent.cluster(cluster: modeler.model())
            case let .rest(modeler): modeler.model()
            case .field: nil
            }
        }
        return Bar(context: context, contents: contents, trailingBarline: barline)
    }
}

private final class ClusterModeler: Modeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let noteModelers: [NoteModeler]

    var context: ClusterContext!

    init(private node: Node, textSource: any NodeSourceTextProvider) throws {
        self.node = node
        self.textSource = textSource

        let children = try node.childrenVerifying(typeIs: .cluster, childrenAre: [.note])

        noteModelers = try children[.note].map {
            try NoteModeler(node: $0, textSource: textSource)
        }
    }

    func provideContext(private head: FlowContext, body: ClusterContextBody) throws -> FlowContext {
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

private final class RestModeler: Modeler {
    let node: Node
    let textSource: NodeSourceTextProvider

    let field: Field
    var content: Bar.BarContent!

    init(private node: Node, textSource: any NodeSourceTextProvider) throws {
        self.node = node
        self.textSource = textSource

        field = try FieldModeler(node: node, textSource: textSource).model()
    }

    func provideContext(private head: FlowContext, body _: Void) throws -> FlowContext {
        content = try field.asRest(baseDuration: head.noteLength)
        return head
    }

    func model() -> Bar.BarContent {
        content
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
    var fermata: Bool
    var accidental: Accidental?
    var chord: Pitch?
    var context: NoteContext!

    init(private node: Node, textSource: any NodeSourceTextProvider) throws {
        self.node = node
        self.textSource = textSource

        children = try node.childrenVerifying(typeIs: .note, childrenAre: [.embellishment, .pitch, .duration, .connector, .shorthandLabel])

        pitch = try children.unique(.pitch).trimmedText(from: textSource).toPitch()

        let connector = try children.optional(.connector)?.trimmedText(from: textSource)
        tied = connector == "_"
        continuesTuplet = connector == "-"
        slurred = connector == "~"

        accidental = nil
        fermata = false
        chord = nil
    }

    func provideContext(private head: FlowContext, body: NoteContextBody) throws -> FlowContext {
        embellishment = if let embellishmentStr = try children.optional(.embellishment)?.trimmedText(from: textSource) {
            try Embellishment(string: embellishmentStr, from: head.previousPitch, on: pitch)
        } else { nil }

        duration = try children.optional(.duration)?.trimmedText(from: textSource).toDuration(modifying: head.noteLength) ?? head.noteLength
        fermata = head.upcomingFermata
        accidental = head.upcomingAccidental
        chord = head.upcomingChord

        if let chord, chord == pitch {
            throw ModelParseError.invalidChord
        }

        if let shorthand = try children.optional(.shorthandLabel)?.trimmedText(from: textSource) {
            let field = try Field(shorthand: shorthand)
            switch field.label {
            case .hold: fermata = true
            case .sharp: accidental = .sharp
            case .flat: accidental = .flat
            case .nat: accidental = .natural
            default: throw ModelParseError.unexpectedField(label: field.label)
            }
        }

        context = NoteContext(head: head, body: body, tail: FlowContext(from: head, previousPitch: pitch, clearingAllUpcoming: true))
        return context.tail
    }

    func model() -> Note {
        Note(context: context,
             pitch: pitch,
             embellishment: embellishment,
             duration: duration,
             tiedToNext: tied,
             slurredToNext: slurred,
             annotation: context.head.upcomingAnnotation,
             fermata: fermata,
             accidental: accidental,
             chord: chord)
    }
}
