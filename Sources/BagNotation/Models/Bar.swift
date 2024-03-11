//
//  Bar.swift
//  Bag Notation
//

public struct Bar {
    let context: Context
    let noteClusters: [[Note]]
    let trailingBarline: Barline

    var notes: [Note] { Array(noteClusters.joined()) }
    var isPickup: Bool {
        context.barNumberInLine == 1 && noteClusters.count < context.timeSignature.beatsPerBar
    }
}

public enum Barline {
    case plain
    case repeatStart
    case repeatEnd
    case partStart
    case partEnd
    case double

    public init?(rawValue: String, context: Context) {
        switch (rawValue, context.barNumberInLine) {
        case ("|", _): self = .plain
        case ("|:", _): self = .repeatStart
        case (":|", _): self = .repeatEnd
        case ("||", 0): self = .partStart
        case ("||", context.barCountInLine): self = .partEnd
        case ("||", _): self = .double
        default: return nil
        }
    }
}

extension String {
    func toBarline(in context: Context) throws -> Barline { try Barline(rawValue: self, context: context) ?! ModelParseError.invalidBarline }
}
