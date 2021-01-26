//
//  TunerButtonsView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/26/21.
//

import SwiftUI
import ComposableArchitecture

struct TunerButtonsView: View {
    let store: Store<Root.State, Root.Action>
        
    var body: some View {
        WithViewStore(store) { viewStore in
            let noteDescriptions = viewStore.notes.map(\.description)
            let noteMidiValues = viewStore.notes.map(\.rawValue)
            
            VStack {
                TunerButtonView(text: noteDescriptions[0]) {
                    viewStore.send(.playMidiNote(noteMidiValues[0]))
                }
                .position(x: 30, y: 43)
                
                TunerButtonView(text: noteDescriptions[1]) {
                    viewStore.send(.playMidiNote(noteMidiValues[1]))
                }
                .position(x: 30, y: -17)
                
                TunerButtonView(text: noteDescriptions[2]) {
                    viewStore.send(.playMidiNote(noteMidiValues[2]))
                }
                .position(x: 30, y: -77)
                
                TunerButtonView(text: noteDescriptions[3]) {
                    viewStore.send(.playMidiNote(noteMidiValues[3]))
                }
                .position(x: 30, y: -137)
                
                TunerButtonView(text: noteDescriptions[4]) {
                    viewStore.send(.playMidiNote(noteMidiValues[4]))
                }
                .position(x: 30, y: -196)
                
                TunerButtonView(text: noteDescriptions[5]) {
                    viewStore.send(.playMidiNote(noteMidiValues[5]))
                }
                .position(x: 30, y: -256)
            }
        }
    }
}

private struct TunerButtonView: View {
    var text: String
    var action: () -> Void
    
    init(text: String,
         action: @escaping () -> ()) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Circle()
                .fill(Color.gray)
                .overlay(Text(text))
        }
        .padding(32)
        .buttonStyle(PlainButtonStyle())
    }
}

struct TunerButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TunerButtonsView(store: Root.defaultStore)
    }
}
