//
//  GuitarView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/25/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

struct RootView: View {
    let store: Store<Root.State, Root.Action>
    let notes = ["E","A","D","G","B","E"]
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                ForEach(GuitarShape.allCases) { guitarShape in
                    ShapeView(bezier: guitarShape.path, pathBounds: GuitarShape.pathBounds)
                        .trim(from: 0, to: 1)
                        .stroke(viewStore.primaryColor)
                        .shadow(radius: viewStore.shadowRadius)
                        .opacity(viewStore.isFilled ? 0 : 1)
                }
                GuitarView(store: store)
                TunersView(store: store)
            }
            .frame(width: viewStore.width, height: viewStore.height)
            .padding()
            .navigationTitle("Guitar Tuner")
            .onAppear {
                withAnimation(
                    .easeInOut(duration: viewStore.animationDuration)) {
                    viewStore.send(.updateStrokeEndAmount(CGFloat(viewStore.animationDuration)))
                }
                withAnimation(
                    Animation
                        .easeInOut(duration: viewStore.animationDuration)
                        .delay(viewStore.animationDuration)) {
                    viewStore.send(.toggleIsFilled)
                }
            }
            .toolbar {
                ToolbarItem {
                    Picker("Tuning",
                           selection: viewStore.binding(
                            get: \.tuning,
                            send: Root.Action.changeTuning)
                    ) {
                        ForEach(Root.Tuning.allCases) { tuning in
                            Text(tuning.rawValue)
                        }
                    }
                }
                ToolbarItem {
                    Picker("Key", selection:
                            viewStore.binding(
                                get: \.rootNote,
                                send: Root.Action.changeKey)
                    ) {
                        ForEach(Key.keysWithFlats, id: \.self) { key in
                            Text(key.description)
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
