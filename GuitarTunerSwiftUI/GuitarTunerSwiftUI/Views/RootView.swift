//
//  RootView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/21/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

// MARK:- ContentView

struct RootView: View {
    let store: Store<Root.State, Root.Action>
    
    @State var strokeEndAmount: CGFloat = 0
    @State var opacity: CGFloat = 0
    @State var isFilled = false
    
    let shadowRadius:CGFloat = 4
    let animationDuration: Double = 1
    let pathBounds = GuitarPaths.pathBounds
    var primaryColor = Color.gray
    //    var secondaryColor = gradient([.white, .gray])
    
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List {}
                HStack {
                    // GuitarTuners
                    VStack {
                        ForEach(viewStore.tuningNotes.map(\.rawValue).reversed(), id: \.self) { midiNote in
                            Button(action: {}) {
                                ZStack {
                                    Circle()
                                        .fill(Color.accentColor)
                                        .opacity(isFilled ? 1 : 0)
                                        .shadow(radius: shadowRadius)
                                    Circle()
                                        .trim(from: 0, to: strokeEndAmount)
                                        .stroke(primaryColor, lineWidth: 2)
                                        .shadow(radius: shadowRadius)
                                        .opacity(isFilled ? 0 : 1)// hide after
                                        .onAppear {
                                            withAnimation(
                                                .easeInOut(duration: animationDuration)) {
                                                strokeEndAmount = CGFloat(animationDuration)
                                            }
                                            withAnimation(
                                                Animation
                                                    .easeInOut(duration: animationDuration)
                                                    .delay(animationDuration)) {
                                                isFilled = true
                                            }
                                        }
                                    
                                    Text(Pitch(midiNote: midiNote).description.filter{$0.isLetter})
                                        .shadow(radius: shadowRadius)

                                }
                            }
                            .frame(width: 40, height: 40)
                            .buttonStyle(PlainButtonStyle())
                            .pressAction {
                                viewStore.send(.playMidiNote(midiNote))
                            } onRelease: {
                                viewStore.send(.stopMidiNote(midiNote))
                            }
                        }
                    }
                    
                    //Guitar
                    GuitarView()
                }

                .navigationTitle("Guitar Tuner")
                .toolbar {
                    ToolbarItem {
                        Picker("Tuning",
                               selection: viewStore.binding(
                                get: \.tuning,
                                send: Root.Action.changeTuning)
                        ) {
                            ForEach(Root.Tuning.allCases, id: \.self) { tuning in
                                Text(tuning.rawValue)
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
