//
//  RootState.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

struct GuitarTuning: Equatable, Hashable {
    enum Tuning: String, CaseIterable {
        case standard = "Standard"
        case dropD = "Drop D"
    }
    
    var tuning: Tuning
    
    var notes: [Pitch] {
        switch tuning {
        case .standard:
            return ["E2", "A2", "D3", "G3", "B3", "E4"]
        case .dropD:
            return ["D2", "A2", "D3", "G3", "B3", "E4"]
        }
    }
}


struct Root {
    struct State: Equatable {
        // state
        var guitarTuning = GuitarTuning(tuning: .standard)
        
    }
    
    enum Action: Equatable {
        // action
        case playMidiNote(Int)
        case stopMidiNote(Int)
        case changeGuitarTuning(GuitarTuning)
    }
    
    struct Environment {
        // environment
        let soundModel = SoundClient(.emuaps_8mb)
        
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Environment>.combine(
        // pullbacks
        
        Reducer { state, action, environment in
            // mutations
            switch action {
            
            case let .playMidiNote(midiNote):
                environment.soundModel.play(midiNote)
                return .none
                
            case let .stopMidiNote(midiNote):
                environment.soundModel.stop(midiNote)
                return .none

            case let .changeGuitarTuning(guitarTuning):
                state.guitarTuning = guitarTuning
                return .none
            }
        }
    )
}

extension Root {
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: .init()
    )
}

// MARK:- RootView

struct RootView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                HStack {
                    ForEach(viewStore.guitarTuning.notes.map(\.rawValue), id: \.self) { midiNote in
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
            .frame(width: 1920/2, height: 1080/2)
            .padding()
            .navigationTitle("Guitar Tuning")
            .toolbar {
                ToolbarItem {
                    Picker("Guitar Tuning",
                           selection: viewStore.binding(
                            get: \.guitarTuning,
                            send: Root.Action.changeGuitarTuning)
                    ) {
                        ForEach(GuitarTuning.Tuning.allCases, id: \.self) { tuning in
                            Text(tuning.rawValue)
                        }
                    }
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
