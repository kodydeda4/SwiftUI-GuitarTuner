//
//  GuitarShape.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//
//  ------------------------------------------------------------------
//  [Source] SwiftUI - SVG to UIBezierPath with Animation
//  https://www.youtube.com/watch?v=IUpN7sIwaqc&ab_channel=StewartLynch
//  ------------------------------------------------------------------

import Cocoa
import SwiftUI

private func gradient(_ colors: [Color])  -> LinearGradient {
    return LinearGradient(
        gradient: Gradient(colors: colors),
        startPoint: .topLeading,
        endPoint: .bottom
    )
}

struct GuitarView: View {
    let pathBounds = GuitarPaths.pathBounds
    
    var primaryColor = Color.gray//gradient([.white, .black])
    var secondaryColor = gradient([.white, .gray])
    
    var body: some View {
        let width: CGFloat = 300
        let height: CGFloat = width * (pathBounds.height/pathBounds.width)
        
        ZStack {
            ZStack {
                
                // Fretboard
                ShapeView(GuitarPaths.fretboard)
                    .fill(gradient([.white, .black]))
                
                // Fret
                ShapeView(GuitarPaths.fret)
                    .fill(gradient([.white, .gray]))
                    
                // Nut
                ShapeView(GuitarPaths.nut)
                    .fill(gradient([.white, .gray]))
                
                // RearTunersBase
                ShapeView(GuitarPaths.rearTunersBase)
                    .fill(primaryColor)
                
                // RearTunersStem
                ShapeView(GuitarPaths.rearTunersStem)
                    .fill(secondaryColor)
            }
            
            // RearTunersKey
            ShapeView(GuitarPaths.rearTunersKey)
                .fill(primaryColor)
            
            // GuitarHeadstock
            ShapeView(GuitarPaths.guitarHeadstock)
                .fill(gradient([.accentColor, .gray]))
            
            // FrontTunersBase
            ShapeView(GuitarPaths.frontTunersBase)
                .fill(primaryColor)
            
            // FrontTunersBolt
            ShapeView(GuitarPaths.frontTunersBolt)
                .fill(secondaryColor)

            // GuitarStrings
            ShapeView(GuitarPaths.guitarStrings)
                .fill(gradient([.white, .gray]))

            // StringTreeBase
            ShapeView(GuitarPaths.stringTreeBase)
                .fill(primaryColor)
                
            
            // StringTreeBolt
            ShapeView(GuitarPaths.stringTreeBolt)
                .fill(secondaryColor)
            
            // FrontTunersPeg
            ShapeView(GuitarPaths.frontTunersPeg)
                .fill(primaryColor)

        }
        .frame(width: width, height: height )
    }
}

// MARK:- ShapeView
private extension ShapeView {
    init(_ bezier: NSBezierPath) {
        self.bezier = bezier
        self.pathBounds = GuitarPaths.pathBounds
    }
}

struct GuitarShapeView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView()
    }
}
