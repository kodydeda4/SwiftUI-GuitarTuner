//
//  GuitarView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/25/21.
//

import SwiftUI
import ComposableArchitecture

struct GuitarFilledView: View {
    let gradientShapes: [GuitarShape] = [
        .fret,
        .nut,
        .guitarStrings
    ]
    
    let primaryGuitarShapes: [GuitarShape] = [
        .tuningCircles,
        .tunerLines,
        .rearTunersBase,
        .frontTunersBase,
        .rearTunersKey,
        .stringTreeBase,
        .frontTunersPeg,
        .stringTreeBase,
        .frontTunersPeg
    ]
    
    let secondaryGuitarShapes: [GuitarShape] = [
        .rearTunersStem,
        .stringTreeBolt,
        .frontTunersBolt,
    ]
    
    var body: some View {
        ZStack {
            ShapeView(GuitarShape.fretboard)
                .fill(gradient([.gray, .black]))

            ShapeView(GuitarShape.guitarHeadstock)
                .fill(gradient([.accentColor, .gray]))
            
            ForEach(gradientShapes) {
                ShapeView($0)
                    .fill(gradient([.white, .gray]))
            }
            ForEach(primaryGuitarShapes) {
                ShapeView($0)
                    .fill(Color.gray)
            }
            ForEach(secondaryGuitarShapes) {
                ShapeView($0)
                    .fill(Color.white)
            }
        }
        .shadow(radius: 2)
    }
}

struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFilledView()
    }
}







