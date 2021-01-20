//
//  NSBezierPath+Extension.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import Cocoa

// [Source] SwiftUI - SVG to UIBezierPath with Animation
// https://www.youtube.com/watch?v=IUpN7sIwaqc&ab_channel=StewartLynch

extension NSBezierPath {
    static func calculateBounds(paths: [NSBezierPath]) -> CGRect {
        let myPaths = NSBezierPath()
        for path in paths {
            myPaths.append(path)
        }
        return (myPaths.bounds)
    }
}
