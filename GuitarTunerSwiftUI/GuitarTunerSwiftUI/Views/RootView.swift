//
//  RootView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//
//  ------------------------------------------------------------------
//  [Source] SwiftUI - SVG to UIBezierPath with Animation
//  https://www.youtube.com/watch?v=IUpN7sIwaqc&ab_channel=StewartLynch
//  ------------------------------------------------------------------

// MARK:- RootView

import Cocoa
import SwiftUI
import ComposableArchitecture
import MusicTheory


struct GuitarView2: View {
    let store: Store<Root.State, Root.Action>
    
    @State var strokeEndAmount: CGFloat = 0
    @State var opacity: CGFloat = 0
    @State var isFilled = false
    
    
    let size: CGFloat = 0.2
    let shadowRadius:CGFloat = 4
    let animationDuration: Double = 1
    
    
    var body: some View {
        let width: CGFloat = size * GuitarShape.pathBounds.width
        let height: CGFloat = size * GuitarShape.pathBounds.height
        
        WithViewStore(store) { viewStore in
            NavigationView {
                List {}
                ZStack {
                    ForEach(GuitarShape.allShapes, id: \.self) { shape in
                        ShapeView(shape.path)
                            .trim(from: 0, to: strokeEndAmount)
                            .stroke(Color.red, lineWidth: 2)
                            .shadow(radius: shadowRadius)
                            .opacity(isFilled ? 0 : 1)
                        
                        ShapeView(shape.path)
                            .fill(shape.fillColor)
                            .opacity(isFilled ? 1 : 0)
                            .shadow(radius: shadowRadius)
                    }
                }
                .frame(width: width, height: height )

            }
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


struct GuitarShapeView2_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView2(store: Root.defaultStore)
    }
}


