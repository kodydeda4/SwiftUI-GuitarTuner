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

// MARK:- ShapeView
private extension ShapeView {
    init(_ bezier: NSBezierPath) {
        self.bezier = bezier
        self.pathBounds = GuitarPaths.pathBounds
    }
}



struct GuitarView: View {
    @State var strokeEndAmount: CGFloat = 0
    @State var opacity: CGFloat = 0
    @State var isFilled = false

    let shadowRadius:CGFloat = 4
    let animationDuration: Double = 1
    let pathBounds = GuitarPaths.pathBounds
    var primaryColor = Color.gray
    var secondaryColor = gradient([.white, .gray])
    
    var body: some View {
        let width: CGFloat = 200
        let height: CGFloat = width * (pathBounds.height/pathBounds.width)

        ZStack {
            strokeShapes
            fillShapes
        }
        .frame(width: width, height: height )
        .onAppear {
            withAnimation(
                .easeInOut(duration: animationDuration)) {
                    strokeEndAmount = CGFloat(animationDuration)
            }
            withAnimation(
                Animation
                    .easeInOut(duration: animationDuration)
                    .delay(animationDuration)) {
                isFilled = true
            }
        }
    }
}



    
extension GuitarView {
    //MARK:- FillShapes
    
    var fillShapes: some View {
        ZStack {
            ZStack {
                // Fretboard
                ShapeView(GuitarPaths.fretboard)
                    .fill(gradient([.white, .black]))
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                // Fret
                ShapeView(GuitarPaths.fret)
                    .fill(gradient([.white, .gray]))
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                    
                // Nut
                ShapeView(GuitarPaths.nut)
                    .fill(gradient([.white, .gray]))
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                // RearTunersBase
                ShapeView(GuitarPaths.rearTunersBase)
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                // RearTunersStem
                ShapeView(GuitarPaths.rearTunersStem)
                    .fill(secondaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
            }
            
            // RearTunersKey
            ShapeView(GuitarPaths.rearTunersKey)
                .fill(primaryColor)
                .opacity(isFilled ? 1 : 0)
                .shadow(radius: shadowRadius)
            
            // GuitarHeadstock
            ShapeView(GuitarPaths.guitarHeadstock)
                .fill(gradient([.accentColor, .gray]))
                .opacity(isFilled ? 1 : 0)
                .shadow(radius: shadowRadius)
            
            // FrontTunersBase
            ShapeView(GuitarPaths.frontTunersBase)
                .fill(primaryColor)
                .opacity(isFilled ? 1 : 0)
                .shadow(radius: shadowRadius)
            
            // FrontTunersBolt
            ShapeView(GuitarPaths.frontTunersBolt)
                .fill(secondaryColor)
                .opacity(isFilled ? 1 : 0)
                .shadow(radius: shadowRadius)

            // GuitarStrings
            ShapeView(GuitarPaths.guitarStrings)
                .fill(gradient([.white, .gray]))
                .opacity(isFilled ? 1 : 0)
                .shadow(radius: shadowRadius)

            // StringTreeBase
            ShapeView(GuitarPaths.stringTreeBase)
                .fill(primaryColor)
                .opacity(isFilled ? 1 : 0)
                .shadow(radius: shadowRadius)
            
            // StringTreeBolt
            ShapeView(GuitarPaths.stringTreeBolt)
                .fill(secondaryColor)
                .opacity(isFilled ? 1 : 0)
                .shadow(radius: shadowRadius)
            
            // FrontTunersPeg
            ShapeView(GuitarPaths.frontTunersPeg)
                .fill(primaryColor)
                .opacity(isFilled ? 1 : 0)
                .shadow(radius: shadowRadius)
        }
    }
    
    // MARK:- StrokeShapes
    var strokeShapes: some View {
        ZStack {
            ZStack {
                // Fretboard
                ShapeView(GuitarPaths.fretboard)
                    .trim(from: 0, to: strokeEndAmount)
                    .stroke(primaryColor, lineWidth: 2)
                    .shadow(radius: shadowRadius)
                    .opacity(isFilled ? 0 : 1)

                
                // Fret
                ShapeView(GuitarPaths.fret)
                    .trim(from: 0, to: strokeEndAmount)
                    .stroke(primaryColor, lineWidth: 2)
                    .shadow(radius: shadowRadius)
                    .opacity(isFilled ? 0 : 1)
                    
                // Nut
                ShapeView(GuitarPaths.nut)
                    .trim(from: 0, to: strokeEndAmount)
                    .stroke(primaryColor, lineWidth: 2)
                    .shadow(radius: shadowRadius)
                    .opacity(isFilled ? 0 : 1)
                
                // RearTunersBase
                ShapeView(GuitarPaths.rearTunersBase)
                    .trim(from: 0, to: strokeEndAmount)
                    .stroke(primaryColor, lineWidth: 2)
                    .shadow(radius: shadowRadius)
                    .opacity(isFilled ? 0 : 1)
                
                // RearTunersStem
                ShapeView(GuitarPaths.rearTunersStem)
                    .trim(from: 0, to: strokeEndAmount)
                    .stroke(primaryColor, lineWidth: 2)
                    .shadow(radius: shadowRadius)
                    .opacity(isFilled ? 0 : 1)
            }
            
            // RearTunersKey
            ShapeView(GuitarPaths.rearTunersKey)
                .trim(from: 0, to: strokeEndAmount)
                .stroke(primaryColor, lineWidth: 2)
                .shadow(radius: shadowRadius)
                .opacity(isFilled ? 0 : 1)
            
            // GuitarHeadstock
            ShapeView(GuitarPaths.guitarHeadstock)
                .trim(from: 0, to: strokeEndAmount)
                .stroke(primaryColor, lineWidth: 2)
                .shadow(radius: shadowRadius)
                .opacity(isFilled ? 0 : 1)
            
            // FrontTunersBase
            ShapeView(GuitarPaths.frontTunersBase)
                .trim(from: 0, to: strokeEndAmount)
                .stroke(primaryColor, lineWidth: 2)
                .shadow(radius: shadowRadius)
                .opacity(isFilled ? 0 : 1)
            
            // FrontTunersBolt
            ShapeView(GuitarPaths.frontTunersBolt)
                .trim(from: 0, to: strokeEndAmount)
                .stroke(primaryColor, lineWidth: 2)
                .shadow(radius: shadowRadius)
                .opacity(isFilled ? 0 : 1)

            // GuitarStrings
            ShapeView(GuitarPaths.guitarStrings)
                .trim(from: 0, to: strokeEndAmount)
                .stroke(primaryColor, lineWidth: 2)
                .shadow(radius: shadowRadius)
                .opacity(isFilled ? 0 : 1)

            // StringTreeBase
            ShapeView(GuitarPaths.stringTreeBase)
                .trim(from: 0, to: strokeEndAmount)
                .stroke(primaryColor, lineWidth: 2)
                .shadow(radius: shadowRadius)
                .opacity(isFilled ? 0 : 1)
                
            
            // StringTreeBolt
            ShapeView(GuitarPaths.stringTreeBolt)
                .trim(from: 0, to: strokeEndAmount)
                .stroke(primaryColor, lineWidth: 2)
                .shadow(radius: shadowRadius)
                .opacity(isFilled ? 0 : 1)
            
            // FrontTunersPeg
            ShapeView(GuitarPaths.frontTunersPeg)
                .trim(from: 0, to: strokeEndAmount)
                .stroke(primaryColor, lineWidth: 2)
                .shadow(radius: shadowRadius)
                .opacity(isFilled ? 0 : 1)
        }
    }
}

struct GuitarShapeView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView()
    }
}
