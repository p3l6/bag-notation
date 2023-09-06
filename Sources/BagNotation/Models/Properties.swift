//
//  Properties.swift
//  Bag Notation
//

import Foundation

struct Properties {
    // props could be applied to all other structs.

    //  or just constructed with a static version of the parent at creation time.

    var tuneNumber: Int
    var lineOffset: Int // needed ?

    var variation: Int
    var timeSignature: String

    var noteLength: String

    var voice: Int

    var lineNumber: Int
    var lineNumberInFile: Int // vs lineOffset.

    var barNumber: Int
    var barNumberInTune: Int // even possible with voices?
}
