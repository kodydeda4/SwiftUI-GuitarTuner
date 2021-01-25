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
        
        let notes: [Pitch] = ["E2","A2","D3","G3","B3","E4"]
        
        var scale: CGFloat = 0.5
        var width: CGFloat { GuitarShape.pathBounds.width * scale }
        var height: CGFloat { GuitarShape.pathBounds.height * scale }

        var isFilled = false
        var strokeEndAmount: CGFloat = 0
        var opacity: CGFloat = 0
        
        let animationDuration: Double = 1
        
        let shadowRadius:CGFloat = 4
        var primaryColor = Color.gray
        var secondaryColor = Color.white
        
        
        var rootNote: Key = "E"
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
        case changeKey(Key)
        case updateStrokeEndAmount(CGFloat)
        case toggleIsFilled
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
                
            case let .updateStrokeEndAmount(amount):
                state.strokeEndAmount = amount
                return .none
            case .toggleIsFilled:
                state.isFilled.toggle()
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



