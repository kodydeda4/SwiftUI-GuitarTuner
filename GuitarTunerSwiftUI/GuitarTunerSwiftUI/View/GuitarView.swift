//
//  GuitarView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/25/21.
//

import SwiftUI
import ComposableArchitecture

struct GuitarView: View {
    let notes = ["E","A","D","G","B","E"]
    var body: some View {
        ZStack {
            
            ForEach(GuitarShape.allCases) { shape in
                ShapeView(bezier: shape.path, pathBounds: GuitarShape.pathBounds)
                    .stroke(Color.red, lineWidth: 1)
                    .shadow(radius: 4)
            }
            VStack {
                TunerButtonView(note: notes[0])
                    .position(x: 29, y: 42)
                                
                TunerButtonView(note: notes[1])
                    .position(x: 29, y: -17)
                
                TunerButtonView(note: notes[2])
                    .position(x: 29, y: -77)
                
                TunerButtonView(note: notes[3])
                    .position(x: 29, y: -137)
                
                TunerButtonView(note: notes[4])
                    .position(x: 29, y: -196)
                
                TunerButtonView(note: notes[5])
                    .position(x: 29, y: -256)
            }
        }
        .frame(width: 0.5 * GuitarShape.pathBounds.width,
               height: 0.5 * GuitarShape.pathBounds.height
        )
    }
}

private struct TunerButtonView: View {
    var note: String
    
    var body: some View {
        Button(action: {}) {
            Circle()
                .padding(30)
                .overlay(Text(note))
        }
        .buttonStyle(PlainButtonStyle())
    }
}


struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView()
    }
}


//case .tuningCircles: do {
//    let shape = NSBezierPath()
//    shape.move(to: CGPoint(x: 119, y: 783.14))
//    shape.curve(to: CGPoint(x: 59.52, y: 842.62), controlPoint1: CGPoint(x: 119, y: 815.99), controlPoint2: CGPoint(x: 92.37, y: 842.62))
//    shape.curve(to: CGPoint(x: 0.04, y: 783.14), controlPoint1: CGPoint(x: 26.67, y: 842.62), controlPoint2: CGPoint(x: 0.04, y: 815.99))
//    shape.curve(to: CGPoint(x: 59.52, y: 723.66), controlPoint1: CGPoint(x: 0.04, y: 750.29), controlPoint2: CGPoint(x: 26.67, y: 723.66))
//    shape.curve(to: CGPoint(x: 101.58, y: 741.08), controlPoint1: CGPoint(x: 75.3, y: 723.66), controlPoint2: CGPoint(x: 90.42, y: 729.93))
//    shape.curve(to: CGPoint(x: 119, y: 783.14), controlPoint1: CGPoint(x: 112.73, y: 752.24), controlPoint2: CGPoint(x: 119, y: 767.36))
//    shape.line(to: CGPoint(x: 119, y: 783.14))
//    shape.close()
//    shape.move(to: CGPoint(x: 59.48, y: 584.06))
//    shape.curve(to: CGPoint(x: 0.04, y: 643.57), controlPoint1: CGPoint(x: 26.64, y: 584.08), controlPoint2: CGPoint(x: 0.03, y: 610.72))
//    shape.curve(to: CGPoint(x: 59.53, y: 703.02), controlPoint1: CGPoint(x: 0.05, y: 676.41), controlPoint2: CGPoint(x: 26.69, y: 703.03))
//    shape.curve(to: CGPoint(x: 119, y: 643.54), controlPoint1: CGPoint(x: 92.38, y: 703.01), controlPoint2: CGPoint(x: 119, y: 676.38))
//    shape.curve(to: CGPoint(x: 101.56, y: 601.47), controlPoint1: CGPoint(x: 119, y: 627.76), controlPoint2: CGPoint(x: 112.73, y: 612.62))
//    shape.curve(to: CGPoint(x: 59.48, y: 584.06), controlPoint1: CGPoint(x: 90.4, y: 590.31), controlPoint2: CGPoint(x: 75.26, y: 584.05))
//    shape.line(to: CGPoint(x: 59.48, y: 584.06))
//    shape.close()
//    shape.move(to: CGPoint(x: 59.48, y: 444.46))
//    shape.curve(to: CGPoint(x: 0.04, y: 503.97), controlPoint1: CGPoint(x: 26.64, y: 444.48), controlPoint2: CGPoint(x: 0.03, y: 471.12))
//    shape.curve(to: CGPoint(x: 59.53, y: 563.42), controlPoint1: CGPoint(x: 0.05, y: 536.81), controlPoint2: CGPoint(x: 26.69, y: 563.43))
//    shape.curve(to: CGPoint(x: 119, y: 503.94), controlPoint1: CGPoint(x: 92.38, y: 563.41), controlPoint2: CGPoint(x: 119, y: 536.78))
//    shape.curve(to: CGPoint(x: 101.56, y: 461.87), controlPoint1: CGPoint(x: 119, y: 488.16), controlPoint2: CGPoint(x: 112.73, y: 473.02))
//    shape.curve(to: CGPoint(x: 59.48, y: 444.46), controlPoint1: CGPoint(x: 90.4, y: 450.71), controlPoint2: CGPoint(x: 75.26, y: 444.45))
//    shape.line(to: CGPoint(x: 59.48, y: 444.46))
//    shape.close()
//    shape.move(to: CGPoint(x: 59.48, y: 304.86))
//    shape.curve(to: CGPoint(x: 0.04, y: 364.37), controlPoint1: CGPoint(x: 26.64, y: 304.88), controlPoint2: CGPoint(x: 0.03, y: 331.52))
//    shape.curve(to: CGPoint(x: 59.53, y: 423.82), controlPoint1: CGPoint(x: 0.05, y: 397.21), controlPoint2: CGPoint(x: 26.69, y: 423.83))
//    shape.curve(to: CGPoint(x: 119, y: 364.34), controlPoint1: CGPoint(x: 92.38, y: 423.81), controlPoint2: CGPoint(x: 119, y: 397.18))
//    shape.curve(to: CGPoint(x: 101.56, y: 322.27), controlPoint1: CGPoint(x: 119, y: 348.56), controlPoint2: CGPoint(x: 112.73, y: 333.42))
//    shape.curve(to: CGPoint(x: 59.48, y: 304.86), controlPoint1: CGPoint(x: 90.4, y: 311.11), controlPoint2: CGPoint(x: 75.26, y: 304.85))
//    shape.line(to: CGPoint(x: 59.48, y: 304.86))
//    shape.close()
//    shape.move(to: CGPoint(x: 59.48, y: 165.26))
//    shape.curve(to: CGPoint(x: 0.04, y: 224.77), controlPoint1: CGPoint(x: 26.64, y: 165.28), controlPoint2: CGPoint(x: 0.03, y: 191.92))
//    shape.curve(to: CGPoint(x: 59.53, y: 284.22), controlPoint1: CGPoint(x: 0.05, y: 257.61), controlPoint2: CGPoint(x: 26.69, y: 284.23))
//    shape.curve(to: CGPoint(x: 119, y: 224.74), controlPoint1: CGPoint(x: 92.38, y: 284.21), controlPoint2: CGPoint(x: 119, y: 257.58))
//    shape.curve(to: CGPoint(x: 101.56, y: 182.67), controlPoint1: CGPoint(x: 119, y: 208.96), controlPoint2: CGPoint(x: 112.73, y: 193.82))
//    shape.curve(to: CGPoint(x: 59.48, y: 165.26), controlPoint1: CGPoint(x: 90.4, y: 171.51), controlPoint2: CGPoint(x: 75.26, y: 165.25))
//    shape.line(to: CGPoint(x: 59.48, y: 165.26))
//    shape.close()
//    shape.move(to: CGPoint(x: 59.48, y: 25.66))
//    shape.curve(to: CGPoint(x: 0.04, y: 85.17), controlPoint1: CGPoint(x: 26.64, y: 25.68), controlPoint2: CGPoint(x: 0.03, y: 52.32))
//    shape.curve(to: CGPoint(x: 59.53, y: 144.62), controlPoint1: CGPoint(x: 0.05, y: 118.01), controlPoint2: CGPoint(x: 26.69, y: 144.63))
//    shape.curve(to: CGPoint(x: 119, y: 85.14), controlPoint1: CGPoint(x: 92.38, y: 144.61), controlPoint2: CGPoint(x: 119, y: 117.98))
//    shape.curve(to: CGPoint(x: 101.56, y: 43.07), controlPoint1: CGPoint(x: 119, y: 69.36), controlPoint2: CGPoint(x: 112.73, y: 54.22))
//    shape.curve(to: CGPoint(x: 59.48, y: 25.66), controlPoint1: CGPoint(x: 90.4, y: 31.91), controlPoint2: CGPoint(x: 75.26, y: 25.65))
//    shape.line(to: CGPoint(x: 59.48, y: 25.66))
//    shape.close()
//    return shape
