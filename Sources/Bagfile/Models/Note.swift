//
//  Note.swift
//  
//
//  Created by Paul Landers on 6/25/23.
//

import Foundation

struct Note {
    let value: Int // enum
    let embellishment: Int // struct: name, wide?, modifier
    let duration: String
    let extras: String // extra characters we don't understand
}
