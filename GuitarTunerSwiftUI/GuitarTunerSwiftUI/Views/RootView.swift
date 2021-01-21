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


struct GuitarView: View {
    let store: Store<Root.State, Root.Action>
    
    @State var strokeEndAmount: CGFloat = 0
    @State var opacity: CGFloat = 0
    @State var isFilled = false
    
    let shadowRadius:CGFloat = 4
    let animationDuration: Double = 1
    let pathBounds = GuitarPaths.pathBounds
    var primaryColor = Color.gray
    var secondaryColor = gradient([.white, .gray])
    
    var body: some View {
        let width: CGFloat = 200
        let height: CGFloat = width * (pathBounds.height/pathBounds.width)
        
        WithViewStore(store) { viewStore in
            NavigationView {
                List {}
                HStack {
                    // GuitarTuners
                    tunersView
                    
                    //Guitar
                    ZStack {
                        strokeShapes
                        fillShapes
                    }
                    .frame(width: width, height: height )
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

struct GuitarShapeView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView(store: Root.defaultStore)
    }
}
