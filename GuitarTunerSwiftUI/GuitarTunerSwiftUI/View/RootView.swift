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
    
    @State var isFilled = false
    @State var strokeEndAmount: CGFloat = 0
    @State var opacity: CGFloat = 0

    let animationDuration: Double = 1

    let shadowRadius:CGFloat = 4
    var primaryColor = Color.gray
    var secondaryColor = Color.white
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                ForEach(GuitarShape.allCases) { guitarShape in
                    ShapeView(bezier: guitarShape.path, pathBounds: GuitarShape.pathBounds)
                    .trim(from: 0, to: strokeEndAmount)
                    .stroke(primaryColor, lineWidth: 1)
                    .shadow(radius: shadowRadius)
                    .opacity(isFilled ? 0 : 1)
                }
                GuitarView(isFilled: isFilled,
                           shadowRadius: shadowRadius,
                           primaryColor: primaryColor,
                           secondaryColor: secondaryColor
                )
                TunersView(isFilled: isFilled,
                           notes: notes,
                           primaryColor: primaryColor
                )
            }
            .frame(width: GuitarShape.pathBounds.width * 0.5, height: GuitarShape.pathBounds.height * 0.5)
            .padding()
            .navigationTitle("Guitar Tuner")
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
// MARK:- GuitarView
 
struct GuitarView: View {
    let notes = ["E","A","D","G","B","E"]
    
    var isFilled: Bool
    let shadowRadius:CGFloat
    var primaryColor: Color
    var secondaryColor: Color
    
    var body: some View {
        ZStack {
            ZStack {
                ShapeView(bezier: GuitarShape.tunerLines.path, pathBounds: GuitarShape.pathBounds)
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.fretboard.path, pathBounds: GuitarShape.pathBounds)
                    .fill(gradient([.white, .black]))
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.fret.path, pathBounds: GuitarShape.pathBounds)
                    .fill(gradient([.white, .gray]))
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.nut.path, pathBounds: GuitarShape.pathBounds)
                    .fill(gradient([.white, .gray]))
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.rearTunersBase.path, pathBounds: GuitarShape.pathBounds)
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.rearTunersStem.path, pathBounds: GuitarShape.pathBounds)
                    .fill(secondaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.rearTunersKey.path, pathBounds: GuitarShape.pathBounds)
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
            }
            
            ZStack {
                ShapeView(bezier: GuitarShape.guitarHeadstock.path, pathBounds: GuitarShape.pathBounds)
                    .fill(gradient([.accentColor, .gray]))
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.frontTunersBase.path, pathBounds: GuitarShape.pathBounds)
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.frontTunersBolt.path, pathBounds: GuitarShape.pathBounds)
                    .fill(secondaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
            }
            
            ZStack {
                ShapeView(bezier: GuitarShape.guitarStrings.path, pathBounds: GuitarShape.pathBounds)
                    .fill(gradient([.white, .gray]))
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.stringTreeBase.path, pathBounds: GuitarShape.pathBounds)
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.stringTreeBolt.path, pathBounds: GuitarShape.pathBounds)
                    .fill(secondaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
                
                ShapeView(bezier: GuitarShape.frontTunersPeg.path, pathBounds: GuitarShape.pathBounds)
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .shadow(radius: shadowRadius)
            }
        }
    }
}

// MARK:- TunerButtonView

struct TunersView: View {
    var isFilled: Bool
    var notes: [String]
    var primaryColor: Color
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Circle()
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .overlay(Text(notes[0]))
            }
            .padding(31)
            .buttonStyle(PlainButtonStyle())
            .position(x: 30, y: 39)
            
            Button(action: {}) {
                Circle()
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .overlay(Text(notes[1]))
            }
            .padding(31)
            .buttonStyle(PlainButtonStyle())
            .position(x: 30, y: -21)
            
            Button(action: {}) {
                Circle()
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .overlay(Text(notes[2]))
            }
            .padding(31)
            .buttonStyle(PlainButtonStyle())
            .position(x: 30, y: -81)
            
            Button(action: {}) {
                Circle()
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .overlay(Text(notes[3]))
            }
            .padding(31)
            .buttonStyle(PlainButtonStyle())
            .position(x: 30, y: -141)
            
            Button(action: {}) {
                Circle()
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .overlay(Text(notes[4]))
            }
            .padding(31)
            .buttonStyle(PlainButtonStyle())
            .position(x: 30, y: -200)
            
            Button(action: {}) {
                Circle()
                    .fill(primaryColor)
                    .opacity(isFilled ? 1 : 0)
                    .overlay(Text(notes[5]))
            }
            .padding(31)
            .buttonStyle(PlainButtonStyle())
            .position(x: 30, y: -261)
        }
    }
}

struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}






