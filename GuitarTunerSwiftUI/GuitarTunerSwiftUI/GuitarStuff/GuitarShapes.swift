//
//  GuitarPaths.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/21/21.
//


import Cocoa
import SwiftUI

struct GuitarShapeView: View {
    let shape: GuitarShape
    var strokeColor: Color = .red
    var fillColor: Color = .accentColor
    
    @State var isFilled: Bool = false
    
    var body: some View {
        ZStack {
            ShapeView(bezier: shape.path, pathBounds: GuitarShape.pathBounds)
                .trim(from: 0, to: 1)
                .stroke(strokeColor, lineWidth: 2)
                .shadow(radius: 2)
                .opacity(isFilled ? 0 : 1)
            
            ShapeView(bezier: shape.path, pathBounds: GuitarShape.pathBounds)
                .fill(fillColor)
                .shadow(radius: 1)
                .opacity(isFilled ? 1 : 0)
        }
    }
}


struct GuitarShapes_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ForEach(GuitarShape.allCases, id: \.self) { shape in
                GuitarShapeView(shape: shape)
            }
        }
    }
}
