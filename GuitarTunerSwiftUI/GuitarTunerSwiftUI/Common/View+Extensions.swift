//
//  View+Extensions.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import Foundation
import SwiftUI

/* MARK:- Handle Press And Release Events in SwiftUI
 https://serialcoder.dev/ios-swift-tutorials/swiftui/handle-press-and-release-events-in-swiftui/
*/

struct PressActions: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}

extension View {
    func pressAction(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(PressActions(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }
}

// Example
private struct ButtonView: View {
    @State var isPressed = false
    
    var body: some View {
        Button(isPressed ? "Pressed" : "Released") {}
        .pressAction {
            isPressed.toggle()
        }
        onRelease: {
            isPressed.toggle()
        }
    }
}

private struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
