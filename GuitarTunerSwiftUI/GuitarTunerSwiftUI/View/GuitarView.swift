//
//  GuitarView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/25/21.
//

import SwiftUI
import ComposableArchitecture

// MARK:- GuitarView

struct GuitarView: View {
    let store: Store<Root.State, Root.Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                ZStack {
                    ShapeView(bezier: GuitarShape.tunerLines.path, pathBounds: GuitarShape.pathBounds)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.fretboard.path, pathBounds: GuitarShape.pathBounds)
                        .fill(gradient([.white, .black]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.fret.path, pathBounds: GuitarShape.pathBounds)
                        .fill(gradient([.white, .gray]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.nut.path, pathBounds: GuitarShape.pathBounds)
                        .fill(gradient([.white, .gray]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.rearTunersBase.path, pathBounds: GuitarShape.pathBounds)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.rearTunersStem.path, pathBounds: GuitarShape.pathBounds)
                        .fill(viewStore.secondaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.rearTunersKey.path, pathBounds: GuitarShape.pathBounds)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                }
                
                ZStack {
                    ShapeView(bezier: GuitarShape.guitarHeadstock.path, pathBounds: GuitarShape.pathBounds)
                        .fill(gradient([.accentColor, .gray]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.frontTunersBase.path, pathBounds: GuitarShape.pathBounds)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.frontTunersBolt.path, pathBounds: GuitarShape.pathBounds)
                        .fill(viewStore.secondaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                }
                
                ZStack {
                    ShapeView(bezier: GuitarShape.guitarStrings.path, pathBounds: GuitarShape.pathBounds)
                        .fill(gradient([.white, .gray]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.stringTreeBase.path, pathBounds: GuitarShape.pathBounds)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.stringTreeBolt.path, pathBounds: GuitarShape.pathBounds)
                        .fill(viewStore.secondaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.frontTunersPeg.path, pathBounds: GuitarShape.pathBounds)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                }
            }
        }
    }
}


struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView(store: Root.defaultStore)
    }
}






