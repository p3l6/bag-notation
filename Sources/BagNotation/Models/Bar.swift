//
//  Bar.swift
//  Bag Notation
//

struct Bar {
    let context: Context
    let noteClusters: [[Note]]
    let trailingBarline: Barline

    var notes: [Note] { Array(noteClusters.joined()) }
    var isPickup: Bool {
        context.barNumberInLine == 1 && noteClusters.count < beatsInBar(context.timeSignature)
    }
}

enum Barline: String {
    case plain = "|"
    case repeatStart = "|:"
    case repeatEnd = ":|"
    case partStart = "[|"
    case partEnd = "|]"
    case double = "||"
}

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
