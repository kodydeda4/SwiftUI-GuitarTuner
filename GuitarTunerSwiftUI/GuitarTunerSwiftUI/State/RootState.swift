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
    struct State: Equatable {
        let tuningNotes: [Pitch] = ["E2","A2","D3","G3","B3","E4"]
    }
    
    enum Action: Equatable {
        case playNote(Int)
    }
    
    struct Environment {
        let soundClient = SoundClient(.guitarAcoustic)
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Environment> { state, action, environment in
        switch action {
        
        case let .playNote(midiNote):
            environment.soundClient.play(midiNote)
            return .none
        }
    }
}

extension Root {
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: .init()
    )
}



