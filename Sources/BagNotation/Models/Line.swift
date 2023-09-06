//
//  Line.swift
//  Bag Notation
//

import Foundation

enum Line {
//    let props: Properties

    case mainHeader(content: String)
    case directive(content: String)
    case comment(content: String)
    case music(bars: [Bar])
}
