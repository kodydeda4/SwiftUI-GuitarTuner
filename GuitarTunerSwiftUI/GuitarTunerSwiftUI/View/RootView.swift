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
    let viewWidth = GuitarShape.pathBounds.width * 0.5
    let viewHeight = GuitarShape.pathBounds.height * 0.5
    
    @State var isOutlined = false
    @State var isFilled = false
        
    func animate(duration: Double) -> Void {
        let animation = Animation.easeInOut(duration: duration)
        withAnimation(animation) {
            isOutlined.toggle()
        }
        withAnimation(animation.delay(duration)) {
            isFilled.toggle()
        }
    }
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                ForEach(GuitarShape.allCases) { shape in
                    ShapeView(shape)
                        .trim(from: 0, to: isOutlined ? 1 : 0)
                        .stroke(Color.gray)
                        .opacity(isFilled ? 0 : 1)
                }
                GuitarFilledView()
                    .opacity(isFilled ? 1 : 0)
                
                TunerButtonsView(store: store)
                    .opacity(isFilled ? 1 : 0)
            }
            .frame(width: viewWidth, height: viewHeight)
            .padding()
            .navigationTitle("Guitar Tuner")
            .onAppear { animate(duration: 2) }
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
