//
//  Bar.swift
//  Bag Notation
//

import Foundation

struct Bar {
    let context: Context
    let noteClusters: [[Note]]
    let trailingBarline: String // TODO: enum of these options
    
    var notes: [Note] { Array(noteClusters.joined()) }
    var isPickup: Bool {
        context.barNumberInLine == 1 && noteClusters.count < beatsInBar(context.timeSignature)
    }
}

private func beatsInBar(_ timeSignature: String) -> Int {
    switch timeSignature {
    case "4/4": 4
    default: 4 // TODO:  the rest
    }
}
