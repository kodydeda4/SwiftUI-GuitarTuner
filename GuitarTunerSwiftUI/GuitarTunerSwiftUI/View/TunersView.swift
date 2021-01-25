//
//  TunersView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/25/21.
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
                    Button(Pitch(midiNote: midiNote).description) { viewStore.send(.playMidiNote(midiNote)) }
                        .frame(width: 40, height: 40)
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct TunersView_Previews: PreviewProvider {
    static var previews: some View {
        TunersView(store: Root.defaultStore)
    }
}
