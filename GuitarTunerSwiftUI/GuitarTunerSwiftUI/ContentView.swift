//
//  ContentView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import SwiftUI


struct ContentView: View {
    let pathBounds = NSBezierPath.calculateBounds(paths: GuitarShape.allPaths)
    

    
    var body: some View {
        let width: CGFloat = 300
        let height: CGFloat = width
            * (pathBounds.height/pathBounds.width)
        
        ZStack {
            ShapeView(bezier: GuitarShape.rearTuners_Base, pathBounds: pathBounds)
                .stroke(Color.red)

            ShapeView(bezier: GuitarShape.rearTuners_Stem, pathBounds: pathBounds)
                .stroke(Color.red)
            
            ShapeView(bezier: GuitarShape.rearTuners_Key, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.guitar_Headstock, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.frontTuners_Base, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.frontTuners_Bolt, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.guitar_Strings, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.stringTree_Base, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.stringTree_Bolt, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.frontTuners_Peg, pathBounds: pathBounds)
                .stroke(Color.red)
            
        }
        .frame(width: width, height: height )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


