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
        context.barNumberInLine == 1 && noteClusters.count < beatsInBar(context.timeSignature)
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

// TODO: extra, now exists on timesig
private func beatsInBar(_ timeSignature: TimeSignature) -> Int {
    switch timeSignature {
    case .time22: 2
    case .time24: 2
    case .time34: 3
    case .time44: 4
    case .time54: 5
    case .time68: 2
    case .time98: 3
    case .time128: 4
    }
}
