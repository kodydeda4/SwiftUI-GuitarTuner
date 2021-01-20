//
//  GuitarTunersView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

struct GuitarTunersView: View {
    let store: Store<Guitar.State, Guitar.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                ForEach(viewStore.tuningNotes.map(\.rawValue).reversed(), id: \.self) { midiNote in
                    Button(Pitch(midiNote: midiNote).description) {}
                        .padding()
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .buttonStyle(PlainButtonStyle())
                        .pressAction {
                            viewStore.send(.playMidiNote(midiNote))
                        } onRelease: {
                            viewStore.send(.stopMidiNote(midiNote))
                        }
                }
            }
        }
    }
}

struct GuitarTunersView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarTunersView(store: Guitar.defaultStore)
    }
}
