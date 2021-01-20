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



// MARK:- GuitarView

struct GuitarView: View {
    let store: Store<Guitar.State, Guitar.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Image("fender_placeholder")
                    .resizable()
                    .scaledToFill()

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
            .frame(width: 970/2, height: 1260/2)
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

struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView(store: Guitar.defaultStore)
    }
}
