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
                    .shadow(radius: 4.0)

                
                // Fret
                ShapeView(GuitarPaths.fret)
                    .fill(gradient([.white, .gray]))
                    .shadow(radius: 4.0)
                    
                // Nut
                ShapeView(GuitarPaths.nut)
                    .fill(gradient([.white, .gray]))
                    .shadow(radius: 4.0)
                
                // RearTunersBase
                ShapeView(GuitarPaths.rearTunersBase)
                    .fill(primaryColor)
                    .shadow(radius: 4.0)
                
                // RearTunersStem
                ShapeView(GuitarPaths.rearTunersStem)
                    .fill(secondaryColor)
                    .shadow(radius: 4.0)
            }
            
            // RearTunersKey
            ShapeView(GuitarPaths.rearTunersKey)
                .fill(primaryColor)
                .shadow(radius: 4.0)
            
            // GuitarHeadstock
            ShapeView(GuitarPaths.guitarHeadstock)
                .fill(gradient([.accentColor, .gray]))
                .shadow(radius: 4.0)
            
            // FrontTunersBase
            ShapeView(GuitarPaths.frontTunersBase)
                .fill(primaryColor)
                .shadow(radius: 4.0)
            
            // FrontTunersBolt
            ShapeView(GuitarPaths.frontTunersBolt)
                .fill(secondaryColor)
                .shadow(radius: 4.0)

            // GuitarStrings
            ShapeView(GuitarPaths.guitarStrings)
                .fill(gradient([.white, .gray]))
                .shadow(radius: 4.0)

            // StringTreeBase
            ShapeView(GuitarPaths.stringTreeBase)
                .fill(primaryColor)
                .shadow(radius: 4.0)
                
            
            // StringTreeBolt
            ShapeView(GuitarPaths.stringTreeBolt)
                .fill(secondaryColor)
                .shadow(radius: 4.0)
            
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
