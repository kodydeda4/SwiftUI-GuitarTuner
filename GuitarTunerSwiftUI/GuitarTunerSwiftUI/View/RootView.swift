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
    
    let frameWidth = GuitarShape.pathBounds.width * 0.5
    let frameHeight = GuitarShape.pathBounds.height * 0.5
    
    @State var isOutlined = false
    @State var isFilled = false
    
    var body: some View {
        WithViewStore(store) { viewStore in
                ZStack {
                    ForEach(GuitarShape.allCases) { shape in
                        ShapeView(shape)
                            .trim(from: 0, to: isOutlined ? 1 : 0)
                            .stroke(Color.gray)
                            .opacity(isOutlined ? 1 : 0)
                    }
                    GuitarFilledView()
                        .opacity(isFilled ? 1 : 0)
                    
                    TunerButtonsView(store: store)
                        .opacity(isFilled ? 1 : 0)
                }
            .frame(width: frameWidth, height: frameHeight)
            .padding()
            .navigationTitle("Guitar Tuner")
            .onAppear { animate(duration: 2) }
            .toolbar {
                ToolbarItem { Button("Animate") { animate(duration: 2) } }
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

extension RootView {
    func animate(duration: Double) -> Void {
        isOutlined = false
        isFilled = false
    
        withAnimation(Animation.easeInOut(duration: duration)) {
            isOutlined.toggle()
        }
        withAnimation(Animation.easeInOut(duration: duration).delay(duration)) {
            isFilled.toggle()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}
