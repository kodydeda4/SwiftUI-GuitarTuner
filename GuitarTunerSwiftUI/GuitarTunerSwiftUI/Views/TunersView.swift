//
//  TunersView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/21/21.
//

import SwiftUI
import ComposableArchitecture
import MusicTheory

extension GuitarView {
    var tunersView: some View {
        WithViewStore(store) { viewStore in
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
        }
    }
}
