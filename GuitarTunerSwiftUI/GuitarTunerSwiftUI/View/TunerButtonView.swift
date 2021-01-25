//
//  TunerButtonView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/25/21.
//

import SwiftUI
import ComposableArchitecture

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

struct TunersView: View {
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

struct TunersView_Previews: PreviewProvider {
    static var previews: some View {
        TunersView(store: Root.defaultStore)
    }
}
