//
//  NSColor+Extension.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import Cocoa

// [Source] SwiftUI - SVG to UIBezierPath with Animation
// https://www.youtube.com/watch?v=IUpN7sIwaqc&ab_channel=StewartLynch

extension NSColor {
    static func fromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> NSColor {
        let r,g,b: CGFloat
        let offset = hexString.hasPrefix("#") ? 1 : 0
        let start = hexString.index(hexString.startIndex, offsetBy: offset)
        let hexColor = String(hexString[start...])
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            b = CGFloat(hexNumber & 0x0000ff) / 255
            return NSColor(red: r, green: g, blue: b, alpha: alpha)
        }
        return NSColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }
}
