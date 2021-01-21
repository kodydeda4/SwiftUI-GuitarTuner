//
//  StrokeShapes.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/21/21.
//

import Foundation
import SwiftUI

// MARK:- StrokeShapes
extension GuitarView {
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
