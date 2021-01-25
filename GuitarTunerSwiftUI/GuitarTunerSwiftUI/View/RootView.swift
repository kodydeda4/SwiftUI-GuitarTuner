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


struct RootView: View {
    let store: Store<Root.State, Root.Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                SidebarView(store: store)

                HStack {
                    TunersView(store: store)
                    GuitarView(store: store)
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
