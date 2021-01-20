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
        // state
        var str = ""
        var scale = Scale(type: .major, key: "C")
        var accidentals: Accidental = .sharp
        var octave = 4

    }
    
    enum Action: Equatable {
        // action
        case scaleTypeChanged(ScaleType)
        case keyChanged(Key)
        case octaveChanged(Int)
        case playMidiNote(Int)
        case stopMidiNote(Int)
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
            
            case let .scaleTypeChanged(scaleType):
                state.scale.type = scaleType
                return .none
                
            case let .keyChanged(key):
                state.scale.key = key
                return .none
                
            case let .octaveChanged(octave):
                state.octave = octave
                return .none
                
            case let .playMidiNote(pitch):
                environment.soundModel.play(pitch)
                return .none
                
            case let .stopMidiNote(pitch):
                environment.soundModel.stop(pitch)
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
            // content
            VStack {
                ForEach(0..<11) { octave in
                    HStack {
                        ForEach(0..<12) { note in
                            let midiNote = note + (octave * 12)
                            let pitch = Pitch(midiNote: midiNote)
                            let color = viewStore
                                .scale
                                .pitches(octave: viewStore.octave)
                                .map(\.rawValue)
                                .contains(midiNote)
                                    ? Color.accentColor
                                    : Color.white

                            Button(action: {}) {
                                RoundedRectangle(cornerRadius: 4)
                                    .foregroundColor(color)
                                    .overlay(
                                        Text(pitch.description)
                                            .foregroundColor(.black)
                                    )
                            }
                            .frame(width: 50, height: 50)
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
            .padding()
            .navigationTitle(
                viewStore
                    .scale
                    .description
                    .filter { $0 != "," }
            )
            .toolbar {
                ToolbarItem {
                    Picker("Key",
                           selection: viewStore.binding(
                            get: \.scale.key,
                            send: Root.Action.keyChanged)
                    ) {
                        ForEach(Key.keysWithSharps, id: \.self) { key in
                            Text(key.description)
                        }
                    }
                    
                }
                ToolbarItem {
                    Picker("Octave",
                           selection: viewStore.binding(
                            get: \.octave,
                            send: Root.Action.octaveChanged)
                    ) {
                        ForEach(0..<10, id: \.self) { octave in
                            Text(octave.description)
                        }
                    }
                }
                ToolbarItem {
                    HStack {
                        Picker("Scale",
                               selection: viewStore.binding(
                                get: \.scale.type,
                                send: Root.Action.scaleTypeChanged)
                        ) {
                            ForEach(ScaleType.all, id: \.self) { scale in
                                Text(scale.description)
                            }
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
