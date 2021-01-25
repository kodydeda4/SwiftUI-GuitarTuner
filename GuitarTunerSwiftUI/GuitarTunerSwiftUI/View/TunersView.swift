//
//  TunersView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/21/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

struct TunersView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                ForEach(viewStore.tuningNotes.map(\.rawValue).reversed(), id: \.self) { midiNote in
                    Button(Pitch(midiNote: midiNote).description) {}
                    .frame(width: 40, height: 40)
                    .buttonStyle(PlainButtonStyle())
                    .pressAction {
                        viewStore.send(.playMidiNote(midiNote))
                    } onRelease: {
//                        viewStore.send(.stop(midiNote))
                    }
                }
            }
        }
    }
}
