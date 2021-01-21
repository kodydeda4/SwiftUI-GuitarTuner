//
//  GuitarHeadstockView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import SwiftUI
import Cocoa

// [Source] https://www.youtube.com/watch?v=IUpN7sIwaqc&ab_channel=StewartLynch

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
