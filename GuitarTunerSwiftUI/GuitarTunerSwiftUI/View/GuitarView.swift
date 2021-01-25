//
//  GuitarView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/25/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

struct GuitarView: View {
    let store: Store<Root.State, Root.Action>
    
    let size: CGFloat = 0.2
    @State var strokeEndAmount: CGFloat = 0
    @State var opacity: CGFloat = 0
    @State var isFilled = false
    
    let shadowRadius:CGFloat = 4
    let animationDuration: Double = 1
    
    var body: some View {
        let width: CGFloat = size * GuitarShape.pathBounds.width
        let height: CGFloat = size * GuitarShape.pathBounds.height

        WithViewStore(store) { viewStore in
            ZStack {
                ForEach(GuitarShape.allCases) { shape in
                    ShapeView(bezier: shape.path, pathBounds: GuitarShape.pathBounds)
                        .trim(from: 0, to: strokeEndAmount)
                        .stroke(Color.red, lineWidth: 2)
                        .shadow(radius: shadowRadius)
                        .opacity(isFilled ? 0 : 1)
                    
                    ShapeView(bezier: shape.path, pathBounds: GuitarShape.pathBounds)
                        .fill(Color.blue)
                        .shadow(radius: shadowRadius)
                        .opacity(isFilled ? 1 : 0)
                }
            }
            .navigationTitle("Guitar Tuner")
            .frame(width: width, height: height)
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

struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView(store: Root.defaultStore)
    }
}
