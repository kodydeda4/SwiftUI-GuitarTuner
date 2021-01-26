//
//  TunerButtonsView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/26/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

struct TunerButtonsView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                ForEach(Array(zip(viewStore.tuningNotes.indices, viewStore.tuningNotes)), id: \.0) { index, note in
                    ZStack {
                        Button(action: { viewStore.send(.playNote(note.rawValue)) }) {
                            Circle()
                                .stroke(Color.gray)
                                .overlay(Text(note.description))
                        }
                        .padding(32)
                        .buttonStyle(PlainButtonStyle())
                        .position(x: 30, y: CGFloat(43 - 60 * index))
                    }
                }
            }
        }
    }
}


struct TunerButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TunerButtonsView(store: Root.defaultStore)
    }
}
