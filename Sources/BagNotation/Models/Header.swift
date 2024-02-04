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
    switch style.trimmingCharacters(in: .whitespaces) {
    case "jig": "6/8"
    case "6/8 March": "6/8"
    // TODO: lower vs upper case?
    // TODO: enum for sigs?
    // TODO: enum for known styles?
    // TODO: the rest
    default: nil
    }
}
