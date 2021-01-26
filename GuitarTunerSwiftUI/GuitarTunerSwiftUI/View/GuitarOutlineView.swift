//
//  GuitarOutlineView.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/26/21.
//

import SwiftUI
import Cocoa

struct GuitarOutlineView: View {
    var body: some View {
        ForEach(GuitarShape.allCases) { shape in
            ShapeView(shape)
                .trim(from: 0, to: 1)
                .stroke(Color.gray)
                .shadow(radius: 4)
        }
    }
}

struct GuitarOutlineView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarOutlineView()
    }
}
