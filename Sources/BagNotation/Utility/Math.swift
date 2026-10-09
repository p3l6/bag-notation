//
//  Math.swift
//  Bag Notation
//

#if !os(Linux)

import CoreGraphics

/// Finds a point that is `d` units away from the midpoint of `ab`, on the perpendicular bisector of `ab`
func offsetMidpoint(a: CGPoint, b: CGPoint, d: CGFloat) -> CGPoint {
    let rise = b.y - a.y
    let run = b.x - a.x
    let abLen = sqrt(pow(rise, 2) + pow(run, 2))
    let midpoint = CGPoint(x: (a.x + b.x) / 2, y: (a.y + b.y) / 2)

    // There are two points that satisfy conditions
    let option1 = CGPoint(x: midpoint.x + d * rise / abLen,
                          y: midpoint.y - d * run / abLen)
    let option2 = CGPoint(x: midpoint.x - d * rise / abLen,
                          y: midpoint.y + d * run / abLen)

    // Use option with highest y
    if option1.y > option2.y {
        return option1
    } else {
        return option2
    }
}

#endif // !os(Linux)
