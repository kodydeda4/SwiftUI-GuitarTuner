//
//  PublicFunctions.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/21/21.
//

import Foundation
import SwiftUI

public func gradient(_ colors: [Color])  -> LinearGradient {
    return LinearGradient(
        gradient: Gradient(colors: colors),
        startPoint: .topLeading,
        endPoint: .bottom
    )
}
