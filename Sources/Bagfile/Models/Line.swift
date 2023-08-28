//
//  Line.swift
//  
//
//  Created by Paul Landers on 6/25/23.
//

import Foundation

enum Line {
//    let props: Properties
    
    case mainHeader(content: String)
    case directive(content: String)
    case comment(content: String)
    case music(bars: [Bar])
}
