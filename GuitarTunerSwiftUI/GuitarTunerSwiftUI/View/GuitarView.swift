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
        .shadow(radius: 4)
    }
}

struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarFilledView()
    }
}

// MARK:- TunerButtonView

private struct TunerButtonView: View {
    let store: Store<Root.State, Root.Action>
    var text: String
    var action: () -> Void
    
    init(store: Store<Root.State, Root.Action>, text: String, closure: @escaping () -> ()) {
        self.store = store
        self.text = text
        self.action = closure
    }
    
    var body: some View {
        WithViewStore (store) { viewStore in
            Button(action: action) {
                Circle()
                    .fill(viewStore.primaryColor)
                    .opacity(viewStore.isFilled ? 1 : 0)
                    .overlay(Text(text))
            }
            .padding(32)
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct TunerButtonsView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                TunerButtonView(store: store, text: viewStore.notes[0].description) { viewStore.send(.playMidiNote(viewStore.notes[0].rawValue)) }
                    .position(x: 30, y: 43)
                
                TunerButtonView(store: store, text: viewStore.notes[1].description) { viewStore.send(.playMidiNote(viewStore.notes[1].rawValue)) }
                    .position(x: 30, y: -17)
                
                TunerButtonView(store: store, text: viewStore.notes[2].description) { viewStore.send(.playMidiNote(viewStore.notes[2].rawValue)) }
                    .position(x: 30, y: -77)
                
                TunerButtonView(store: store, text: viewStore.notes[3].description) { viewStore.send(.playMidiNote(viewStore.notes[3].rawValue)) }
                    .position(x: 30, y: -137)
                
                TunerButtonView(store: store, text: viewStore.notes[4].description) { viewStore.send(.playMidiNote(viewStore.notes[4].rawValue)) }
                    .position(x: 30, y: -196)
                
                TunerButtonView(store: store, text: viewStore.notes[5].description) { viewStore.send(.playMidiNote(viewStore.notes[5].rawValue)) }
                    .position(x: 30, y: -256)
            }
        }
    }
}

struct TunerButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TunerButtonsView(store: Root.defaultStore)
    }
}
