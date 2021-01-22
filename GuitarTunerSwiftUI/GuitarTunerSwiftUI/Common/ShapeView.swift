//
//  ShapeView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/21/21.
//
//  ------------------------------------------------------------------
//  [Source] SwiftUI - SVG to UIBezierPath with Animation
//  https://www.youtube.com/watch?v=IUpN7sIwaqc&ab_channel=StewartLynch
//  ------------------------------------------------------------------

import Foundation
import SwiftUI

struct ShapeView: Shape {
    let bezier: NSBezierPath
    let pathBounds: CGRect

    func path(in rect: CGRect) -> Path {
        let pointScale = (rect.width >= rect.height)
            ? max(pathBounds.height, pathBounds.width)
            : min(pathBounds.height, pathBounds.width)

        let pointTransform = CGAffineTransform(scaleX: 1/pointScale, y: 1/pointScale)
        let path = Path(bezier.cgPath).applying(pointTransform)
        let multiplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return path.applying(transform)
    }
}



// MARK:- ShapeView
extension ShapeView {
    init(_ bezier: NSBezierPath) {
        self.bezier = bezier
        self.pathBounds = GuitarShape.pathBounds
    }
}
