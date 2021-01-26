//
//  RootState.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

struct Root {
    enum Tuning: String, CaseIterable, Identifiable {
        var id: Tuning { self }
        case standard = "Standard"
        case dropD = "Drop D"
    }
    
    struct State: Equatable {
        var rootNote: Key = "E"
        var tuning: Tuning = .standard
        let notes: [Pitch] = ["E2","A2","D3","G3","B3","E4"]
        
        

        
        
    }
    
    enum Action: Equatable {
        // action
        case playMidiNote(Int)
        case stopMidiNote(Int)
        case changeTuning(Tuning)
        case changeKey(Key)
    }
    
    struct Environment {
        // environment
        let soundClient = SoundClient(.guitarAcoustic)

        
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Environment>.combine(
        // pullbacks
        
        Reducer { state, action, environment in
            // mutations
            switch action {
            
            case let .playMidiNote(midiNote):
                environment.soundClient.play(midiNote)
                return .none
                
            case let .stopMidiNote(midiNote):
                environment.soundClient.stop(midiNote)
                return .none
                
            case let .changeTuning(tuning):
                state.tuning = tuning
                return .none
                
            case let .changeKey(key):
                state.rootNote = key
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



