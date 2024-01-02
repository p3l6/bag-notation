//
//  Header.swift
//  Bag Notation
//

import Foundation

struct Header {
    let title: String
    let style: String
    let composer: String
    let noteLength: String
    let timeSignature: String
}

func impliedTimeSignature(for style: String) -> String? {
    switch style {
    case "jig": "6/8"
    // TODO:  the rest
    default: nil
    }
}
