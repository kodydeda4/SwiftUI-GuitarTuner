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
    
    enum Tuning: String, CaseIterable {
        case standard = "Standard"
        case dropD = "Drop D"
    }
    
    struct State: Equatable {
        var soundModel = SoundClient(.guitar3)
        
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
        
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Environment>.combine(
        // pullbacks
        
        Reducer { state, action, environment in
            // mutations
            switch action {
            
            case let .playMidiNote(midiNote):
                state.soundModel.play(midiNote)
                return .none
                
            case let .stopMidiNote(midiNote):
                state.soundModel.stop(midiNote)
                return .none
                
            case let .changeTuning(tuning):
                state.tuning = tuning
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



