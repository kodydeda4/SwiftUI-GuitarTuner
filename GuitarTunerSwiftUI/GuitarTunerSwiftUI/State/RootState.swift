//
//  RootState.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

struct Guitar {
    enum Tuning: String, CaseIterable {
        case standard = "Standard"
        case dropD = "Drop D"
    }
    
    struct State: Equatable {
        var tuning: Tuning = .standard
        var tuningNotes: [Pitch] {
            switch tuning {
   
            case .standard:
                return ["E2", "A2", "D3", "G3", "B3", "E4"]
            case .dropD:
                return ["D2", "A2", "D3", "G3", "B3", "E4"]
            }
        }
    }
    
    enum Action: Equatable {
        // action
        case playMidiNote(Int)
        case stopMidiNote(Int)
        case changeTuning(Tuning)
    }
    
    struct Environment {
        // environment
        let soundModel = SoundClient(.emuaps_8mb)
        
    }
}

extension Guitar {
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

            case let .changeTuning(tuning):
                state.tuning = tuning
                return .none
            }
        }
    )
}

extension Guitar {
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: .init()
    )
}



// MARK:- ContentView

struct ContentView: View {
    let store: Store<Guitar.State, Guitar.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                GuitarTunersView(store: store)
                    .padding()
                    
                Spacer()
            }
            .padding()
            .navigationTitle("Guitar Tuner")
            .toolbar {
                ToolbarItem {
                    Picker("Tuning",
                           selection: viewStore.binding(
                            get: \.tuning,
                            send: Guitar.Action.changeTuning)
                    ) {
                        ForEach(Guitar.Tuning.allCases, id: \.self) { tuning in
                            Text(tuning.rawValue)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Guitar.defaultStore)
    }
}
