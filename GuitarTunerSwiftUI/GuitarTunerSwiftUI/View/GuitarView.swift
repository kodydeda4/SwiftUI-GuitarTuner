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
                Group {
                    ShapeView(bezier: GuitarShape.tunerLines.path)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.fretboard.path)
                        .fill(gradient([.white, .black]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.fret.path)
                        .fill(gradient([.white, .gray]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.nut.path)
                        .fill(gradient([.white, .gray]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.rearTunersBase.path)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                }
                
                Group {
                    ShapeView(bezier: GuitarShape.rearTunersStem.path)
                        .fill(viewStore.secondaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.rearTunersKey.path)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)

                    ShapeView(bezier: GuitarShape.guitarHeadstock.path)
                        .fill(gradient([.accentColor, .gray]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.frontTunersBase.path)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.frontTunersBolt.path)
                        .fill(viewStore.secondaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                }
                Group {
                    ShapeView(bezier: GuitarShape.guitarStrings.path)
                        .fill(gradient([.white, .gray]))
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.stringTreeBase.path)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.stringTreeBolt.path)
                        .fill(viewStore.secondaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                    
                    ShapeView(bezier: GuitarShape.frontTunersPeg.path)
                        .fill(viewStore.primaryColor)
                        .opacity(viewStore.isFilled ? 1 : 0)
                        .shadow(radius: viewStore.shadowRadius)
                }
            }
        }
    }
}

private extension ShapeView {
    init(bezier: NSBezierPath) {
        self.bezier = bezier
        self.pathBounds = GuitarShape.pathBounds
    }
}

struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView(store: Root.defaultStore)
    }
}






