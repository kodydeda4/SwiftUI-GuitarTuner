//
//  GuitarShape.swift
//  GuitarTunerSwiftUI
//
//  Created by Kody Deda on 1/20/21.
//

import Cocoa
import SwiftUI

// [Source] SwiftUI - SVG to UIBezierPath with Animation
// https://www.youtube.com/watch?v=IUpN7sIwaqc&ab_channel=StewartLynch

// MARK:- View
struct GuitarShapeView: View {
    let pathBounds = NSBezierPath.calculateBounds(paths: GuitarShape.allPaths)
    
    var body: some View {
        let width: CGFloat = 300
        let height: CGFloat = width
            * (pathBounds.height/pathBounds.width)
        
        ZStack {
            ZStack {
            ShapeView(bezier: GuitarShape.guitarFretboard, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.guitarFrets, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.guitarNut, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.rearTuners_Base, pathBounds: pathBounds)
                .stroke(Color.red)
            ShapeView(bezier: GuitarShape.rearTuners_Stem, pathBounds: pathBounds)
                .stroke(Color.red)
            }
            
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

struct GuitarShapeView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarShapeView()
    }
}

// MARK:- Shapes

struct GuitarShape {
    static var allPaths: [NSBezierPath] = [
        guitarFretboard,
        rearTuners_Base,
        rearTuners_Stem,
        rearTuners_Key,
        guitar_Headstock,
        frontTuners_Base,
        frontTuners_Bolt,
        guitar_Strings,
        stringTree_Base,
        stringTree_Bolt,
        frontTuners_Peg,
    ]
    
    static var guitarFretboard: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 399.08, y: 1358))
        shape.line(to: CGPoint(x: 129.81, y: 1358))
        shape.line(to: CGPoint(x: 129.81, y: 1122.43))
        shape.line(to: CGPoint(x: 399.08, y: 1122.43))
        shape.line(to: CGPoint(x: 399.08, y: 1358))
        shape.close()
        shape.move(to: CGPoint(x: 399.08, y: 1374))
        shape.line(to: CGPoint(x: 129.8, y: 1374))
        shape.line(to: CGPoint(x: 129.8, y: 1539.47))
        shape.line(to: CGPoint(x: 399.08, y: 1539.47))
        shape.line(to: CGPoint(x: 399.08, y: 1374))
        shape.close()
        shape.move(to: CGPoint(x: 399.08, y: 1069.28))
        shape.line(to: CGPoint(x: 129.8, y: 1069.28))
        shape.line(to: CGPoint(x: 129.8, y: 1093.22))
        shape.line(to: CGPoint(x: 399.08, y: 1093.22))
        shape.line(to: CGPoint(x: 399.08, y: 1069.28))
        shape.close()
        return shape
    }
    
    static var guitarFrets: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 399.08, y: 1358))
        shape.line(to: CGPoint(x: 399.08, y: 1374))
        shape.line(to: CGPoint(x: 129.8, y: 1374))
        shape.line(to: CGPoint(x: 129.8, y: 1358))
        shape.close()
        return shape
    }
    
    static var guitarNut: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 129.8, y: 1122.45))
        shape.line(to: CGPoint(x: 399.08, y: 1122.45))
        shape.line(to: CGPoint(x: 399.08, y: 1093.18))
        shape.line(to: CGPoint(x: 129.81, y: 1093.18))
        shape.line(to: CGPoint(x: 129.8, y: 1122.45))
        shape.close()
        return shape
    }
    
    static var rearTuners_Base: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 105.56, y: 770.7))
        shape.line(to: CGPoint(x: 84.83, y: 830))
        shape.line(to: CGPoint(x: 61.83, y: 822))
        shape.line(to: CGPoint(x: 82.56, y: 762.67))
        shape.line(to: CGPoint(x: 105.56, y: 770.7))
        shape.close()
        shape.move(to: CGPoint(x: 125.83, y: 626.16))
        shape.line(to: CGPoint(x: 105.15, y: 685.49))
        shape.line(to: CGPoint(x: 128.15, y: 693.49))
        shape.line(to: CGPoint(x: 148.88, y: 634.16))
        shape.line(to: CGPoint(x: 125.83, y: 626.16))
        shape.close()
        shape.move(to: CGPoint(x: 167.21, y: 489.67))
        shape.line(to: CGPoint(x: 146.48, y: 549))
        shape.line(to: CGPoint(x: 169.48, y: 557))
        shape.line(to: CGPoint(x: 190.21, y: 497.67))
        shape.line(to: CGPoint(x: 167.21, y: 489.67))
        shape.close()
        shape.move(to: CGPoint(x: 210.52, y: 353.17))
        shape.line(to: CGPoint(x: 189.79, y: 412.51))
        shape.line(to: CGPoint(x: 212.79, y: 420.56))
        shape.line(to: CGPoint(x: 233.52, y: 361.22))
        shape.line(to: CGPoint(x: 210.52, y: 353.17))
        shape.close()
        shape.move(to: CGPoint(x: 252.2, y: 216.68))
        shape.line(to: CGPoint(x: 231.47, y: 276))
        shape.line(to: CGPoint(x: 254.47, y: 284))
        shape.line(to: CGPoint(x: 275.2, y: 224.67))
        shape.line(to: CGPoint(x: 252.2, y: 216.68))
        shape.close()
        shape.move(to: CGPoint(x: 294.15, y: 82.12))
        shape.line(to: CGPoint(x: 273.42, y: 141.46))
        shape.line(to: CGPoint(x: 301.29, y: 151.19))
        shape.line(to: CGPoint(x: 322.02, y: 91.86))
        shape.line(to: CGPoint(x: 294.15, y: 82.12))
        shape.close()
        return shape
    }
        
    static var rearTuners_Stem: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 112.24, y: 641.1))
        shape.line(to: CGPoint(x: 119.7, y: 643.71))
        shape.line(to: CGPoint(x: 111.23, y: 668))
        shape.line(to: CGPoint(x: 103.77, y: 665.39))
        shape.line(to: CGPoint(x: 112.24, y: 641.1))
        shape.close()
        shape.move(to: CGPoint(x: 145.15, y: 528.85))
        shape.line(to: CGPoint(x: 152.6, y: 531.45))
        shape.line(to: CGPoint(x: 161.07, y: 507.21))
        shape.line(to: CGPoint(x: 153.61, y: 504.61))
        shape.line(to: CGPoint(x: 145.15, y: 528.85))
        shape.close()
        shape.move(to: CGPoint(x: 188.45, y: 392.36))
        shape.line(to: CGPoint(x: 195.91, y: 394.96))
        shape.line(to: CGPoint(x: 204.38, y: 370.72))
        shape.line(to: CGPoint(x: 196.92, y: 368.12))
        shape.line(to: CGPoint(x: 188.45, y: 392.36))
        shape.close()
        shape.move(to: CGPoint(x: 230.15, y: 255.86))
        shape.line(to: CGPoint(x: 237.61, y: 258.47))
        shape.line(to: CGPoint(x: 246.08, y: 234.23))
        shape.line(to: CGPoint(x: 238.62, y: 231.62))
        shape.line(to: CGPoint(x: 230.15, y: 255.86))
        shape.close()
        shape.move(to: CGPoint(x: 272.15, y: 121.3))
        shape.line(to: CGPoint(x: 279.6, y: 123.91))
        shape.line(to: CGPoint(x: 288.07, y: 99.67))
        shape.line(to: CGPoint(x: 280.62, y: 97.06))
        shape.line(to: CGPoint(x: 272.15, y: 121.3))
        shape.close()
        shape.move(to: CGPoint(x: 68.94, y: 777.59))
        shape.line(to: CGPoint(x: 76.4, y: 780.2))
        shape.line(to: CGPoint(x: 67.93, y: 804.44))
        shape.line(to: CGPoint(x: 60.47, y: 801.83))
        shape.line(to: CGPoint(x: 68.94, y: 777.59))
        shape.close()
        return shape
    }
    
    static var rearTuners_Key: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 46.68, y: 725.4))
        shape.line(to: CGPoint(x: 82.77, y: 738))
        shape.line(to: CGPoint(x: 46.64, y: 841.41))
        shape.line(to: CGPoint(x: 10.71, y: 828.86))
        shape.line(to: CGPoint(x: 10.71, y: 828.86))
        shape.line(to: CGPoint(x: 10.55, y: 828.8))
        shape.line(to: CGPoint(x: 10.55, y: 828.8))
        shape.curve(to: CGPoint(x: 6.37, y: 769.35), controlPoint1: CGPoint(x: -1.68, y: 824.31), controlPoint2: CGPoint(x: -3.56, y: 797.8))
        shape.curve(to: CGPoint(x: 46.66, y: 725.42), controlPoint1: CGPoint(x: 16.3, y: 740.9), controlPoint2: CGPoint(x: 34.3, y: 721.35))
        shape.line(to: CGPoint(x: 46.68, y: 725.4))
        shape.close()
        shape.move(to: CGPoint(x: 89.98, y: 588.92))
        shape.curve(to: CGPoint(x: 49.68, y: 632.84), controlPoint1: CGPoint(x: 77.61, y: 584.83), controlPoint2: CGPoint(x: 59.62, y: 604.42))
        shape.curve(to: CGPoint(x: 53.86, y: 692.3), controlPoint1: CGPoint(x: 39.74, y: 661.26), controlPoint2: CGPoint(x: 41.68, y: 687.84))
        shape.line(to: CGPoint(x: 53.86, y: 692.3))
        shape.line(to: CGPoint(x: 54.02, y: 692.36))
        shape.line(to: CGPoint(x: 54.02, y: 692.36))
        shape.line(to: CGPoint(x: 89.95, y: 704.91))
        shape.line(to: CGPoint(x: 126.07, y: 601.51))
        shape.line(to: CGPoint(x: 89.98, y: 588.9))
        shape.line(to: CGPoint(x: 89.98, y: 588.92))
        shape.close()
        shape.move(to: CGPoint(x: 131.36, y: 452.42))
        shape.line(to: CGPoint(x: 167.45, y: 465))
        shape.line(to: CGPoint(x: 131.33, y: 568.4))
        shape.line(to: CGPoint(x: 95.4, y: 555.84))
        shape.line(to: CGPoint(x: 95.4, y: 555.84))
        shape.line(to: CGPoint(x: 95.24, y: 555.84))
        shape.line(to: CGPoint(x: 95.24, y: 555.84))
        shape.curve(to: CGPoint(x: 91.07, y: 496.38), controlPoint1: CGPoint(x: 83.02, y: 551.34), controlPoint2: CGPoint(x: 81.13, y: 524.84))
        shape.curve(to: CGPoint(x: 131.36, y: 452.46), controlPoint1: CGPoint(x: 101.01, y: 467.92), controlPoint2: CGPoint(x: 118.99, y: 448.38))
        shape.line(to: CGPoint(x: 131.36, y: 452.42))
        shape.close()
        shape.move(to: CGPoint(x: 174.67, y: 315.93))
        shape.line(to: CGPoint(x: 210.76, y: 328.54))
        shape.line(to: CGPoint(x: 174.63, y: 431.94))
        shape.line(to: CGPoint(x: 138.7, y: 419.38))
        shape.line(to: CGPoint(x: 138.7, y: 419.38))
        shape.line(to: CGPoint(x: 138.54, y: 419.33))
        shape.line(to: CGPoint(x: 138.54, y: 419.33))
        shape.curve(to: CGPoint(x: 134.36, y: 359.87), controlPoint1: CGPoint(x: 126.31, y: 414.83), controlPoint2: CGPoint(x: 124.43, y: 388.33))
        shape.curve(to: CGPoint(x: 174.65, y: 315.95), controlPoint1: CGPoint(x: 144.29, y: 331.41), controlPoint2: CGPoint(x: 162.29, y: 311.87))
        shape.line(to: CGPoint(x: 174.67, y: 315.93))
        shape.close()
        shape.move(to: CGPoint(x: 216.35, y: 179.43))
        shape.line(to: CGPoint(x: 252.44, y: 192))
        shape.line(to: CGPoint(x: 216.31, y: 295.4))
        shape.line(to: CGPoint(x: 180.38, y: 282.85))
        shape.line(to: CGPoint(x: 180.38, y: 282.85))
        shape.line(to: CGPoint(x: 180.22, y: 282.79))
        shape.line(to: CGPoint(x: 180.22, y: 282.79))
        shape.curve(to: CGPoint(x: 176.05, y: 223.34), controlPoint1: CGPoint(x: 168, y: 278.3), controlPoint2: CGPoint(x: 166.12, y: 251.79))
        shape.curve(to: CGPoint(x: 216.34, y: 179.41), controlPoint1: CGPoint(x: 185.98, y: 194.89), controlPoint2: CGPoint(x: 203.98, y: 175.34))
        shape.line(to: CGPoint(x: 216.35, y: 179.43))
        shape.close()
        shape.move(to: CGPoint(x: 258.35, y: 44.87))
        shape.line(to: CGPoint(x: 294.44, y: 57.48))
        shape.line(to: CGPoint(x: 258.32, y: 160.88))
        shape.line(to: CGPoint(x: 222.39, y: 148.33))
        shape.line(to: CGPoint(x: 222.39, y: 148.33))
        shape.line(to: CGPoint(x: 222.23, y: 148.27))
        shape.line(to: CGPoint(x: 222.23, y: 148.27))
        shape.curve(to: CGPoint(x: 218.06, y: 88.82), controlPoint1: CGPoint(x: 210.01, y: 143.78), controlPoint2: CGPoint(x: 208.13, y: 117.27))
        shape.curve(to: CGPoint(x: 258.35, y: 44.89), controlPoint1: CGPoint(x: 227.99, y: 60.37), controlPoint2: CGPoint(x: 245.99, y: 40.82))
        shape.line(to: CGPoint(x: 258.35, y: 44.87))
        shape.close()
        return shape
    }
    
    static var guitar_Headstock: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 47.69, y: 957.85))
        shape.curve(to: CGPoint(x: 47.95, y: 927.2), controlPoint1: CGPoint(x: 44.62, y: 947.85), controlPoint2: CGPoint(x: 44.71, y: 937.15))
        shape.line(to: CGPoint(x: 311.52, y: 96))
        shape.curve(to: CGPoint(x: 323.57, y: 72.22), controlPoint1: CGPoint(x: 313.52, y: 89.48), controlPoint2: CGPoint(x: 319.65, y: 77.72))
        shape.curve(to: CGPoint(x: 512.65, y: 302.31), controlPoint1: CGPoint(x: 473.65, y: -138.88), controlPoint2: CGPoint(x: 720.49, y: 174.09))
        shape.curve(to: CGPoint(x: 466.47, y: 389.63), controlPoint1: CGPoint(x: 482.55, y: 320.88), controlPoint2: CGPoint(x: 464.88, y: 354.3))
        shape.curve(to: CGPoint(x: 541.86, y: 786.81), controlPoint1: CGPoint(x: 473.42, y: 541.93), controlPoint2: CGPoint(x: 543.26, y: 670.97))
        shape.curve(to: CGPoint(x: 514.26, y: 841.43), controlPoint1: CGPoint(x: 541.65, y: 804.03), controlPoint2: CGPoint(x: 529.81, y: 834.01))
        shape.curve(to: CGPoint(x: 399.08, y: 1069.22), controlPoint1: CGPoint(x: 416.34, y: 888.18), controlPoint2: CGPoint(x: 396.15, y: 951.72))
        shape.line(to: CGPoint(x: 129.8, y: 1069.22))
        shape.curve(to: CGPoint(x: 68.88, y: 987.63), controlPoint1: CGPoint(x: 124.52, y: 1019.34), controlPoint2: CGPoint(x: 86.8, y: 1004.05))
        shape.curve(to: CGPoint(x: 47.69, y: 957.85), controlPoint1: CGPoint(x: 60.15, y: 979.67), controlPoint2: CGPoint(x: 51.75, y: 970.7))
        shape.close()
        return shape
    }
    
    static var frontTuners_Base: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 396.41, y: 171))
        shape.curve(to: CGPoint(x: 358.03, y: 209.38), controlPoint1: CGPoint(x: 396.41, y: 192.2), controlPoint2: CGPoint(x: 379.23, y: 209.38))
        shape.curve(to: CGPoint(x: 319.65, y: 171), controlPoint1: CGPoint(x: 336.83, y: 209.38), controlPoint2: CGPoint(x: 319.65, y: 192.2))
        shape.curve(to: CGPoint(x: 358.03, y: 132.62), controlPoint1: CGPoint(x: 319.65, y: 149.8), controlPoint2: CGPoint(x: 336.83, y: 132.62))
        shape.curve(to: CGPoint(x: 396.41, y: 171), controlPoint1: CGPoint(x: 379.23, y: 132.62), controlPoint2: CGPoint(x: 396.41, y: 149.8))
        shape.line(to: CGPoint(x: 396.41, y: 171))
        shape.close()
        shape.move(to: CGPoint(x: 315.75, y: 271))
        shape.curve(to: CGPoint(x: 277.39, y: 309.4), controlPoint1: CGPoint(x: 294.55, y: 271.01), controlPoint2: CGPoint(x: 277.38, y: 288.2))
        shape.curve(to: CGPoint(x: 315.78, y: 347.76), controlPoint1: CGPoint(x: 277.4, y: 330.59), controlPoint2: CGPoint(x: 294.59, y: 347.77))
        shape.curve(to: CGPoint(x: 354.15, y: 309.37), controlPoint1: CGPoint(x: 336.98, y: 347.75), controlPoint2: CGPoint(x: 354.16, y: 330.57))
        shape.curve(to: CGPoint(x: 342.9, y: 282.23), controlPoint1: CGPoint(x: 354.15, y: 299.19), controlPoint2: CGPoint(x: 350.1, y: 289.42))
        shape.curve(to: CGPoint(x: 315.75, y: 271), controlPoint1: CGPoint(x: 335.7, y: 275.03), controlPoint2: CGPoint(x: 325.93, y: 270.99))
        shape.close()
        shape.move(to: CGPoint(x: 270.97, y: 408.52))
        shape.curve(to: CGPoint(x: 232.59, y: 446.9), controlPoint1: CGPoint(x: 249.77, y: 408.52), controlPoint2: CGPoint(x: 232.59, y: 425.7))
        shape.curve(to: CGPoint(x: 270.97, y: 485.28), controlPoint1: CGPoint(x: 232.59, y: 468.1), controlPoint2: CGPoint(x: 249.77, y: 485.28))
        shape.curve(to: CGPoint(x: 309.35, y: 446.9), controlPoint1: CGPoint(x: 292.17, y: 485.28), controlPoint2: CGPoint(x: 309.35, y: 468.1))
        shape.curve(to: CGPoint(x: 270.97, y: 408.52), controlPoint1: CGPoint(x: 309.35, y: 425.7), controlPoint2: CGPoint(x: 292.17, y: 408.52))
        shape.line(to: CGPoint(x: 270.97, y: 408.52))
        shape.close()
        shape.move(to: CGPoint(x: 227.78, y: 544.67))
        shape.curve(to: CGPoint(x: 192.31, y: 568.36), controlPoint1: CGPoint(x: 212.26, y: 544.67), controlPoint2: CGPoint(x: 198.26, y: 554.01))
        shape.curve(to: CGPoint(x: 200.63, y: 610.19), controlPoint1: CGPoint(x: 186.37, y: 582.7), controlPoint2: CGPoint(x: 189.65, y: 599.21))
        shape.curve(to: CGPoint(x: 242.46, y: 618.51), controlPoint1: CGPoint(x: 211.6, y: 621.16), controlPoint2: CGPoint(x: 228.11, y: 624.45))
        shape.curve(to: CGPoint(x: 266.15, y: 583.05), controlPoint1: CGPoint(x: 256.8, y: 612.57), controlPoint2: CGPoint(x: 266.15, y: 598.57))
        shape.curve(to: CGPoint(x: 227.78, y: 544.67), controlPoint1: CGPoint(x: 266.15, y: 561.86), controlPoint2: CGPoint(x: 248.97, y: 544.68))
        shape.line(to: CGPoint(x: 227.78, y: 544.67))
        shape.close()
        shape.move(to: CGPoint(x: 183.24, y: 681.54))
        shape.curve(to: CGPoint(x: 147.78, y: 705.23), controlPoint1: CGPoint(x: 167.72, y: 681.54), controlPoint2: CGPoint(x: 153.72, y: 690.89))
        shape.curve(to: CGPoint(x: 156.1, y: 747.06), controlPoint1: CGPoint(x: 141.84, y: 719.57), controlPoint2: CGPoint(x: 145.12, y: 736.08))
        shape.curve(to: CGPoint(x: 197.93, y: 755.38), controlPoint1: CGPoint(x: 167.08, y: 758.04), controlPoint2: CGPoint(x: 183.59, y: 761.32))
        shape.curve(to: CGPoint(x: 221.62, y: 719.92), controlPoint1: CGPoint(x: 212.27, y: 749.44), controlPoint2: CGPoint(x: 221.62, y: 735.44))
        shape.curve(to: CGPoint(x: 210.38, y: 692.78), controlPoint1: CGPoint(x: 221.62, y: 709.74), controlPoint2: CGPoint(x: 217.58, y: 699.98))
        shape.curve(to: CGPoint(x: 183.24, y: 681.54), controlPoint1: CGPoint(x: 203.18, y: 685.58), controlPoint2: CGPoint(x: 193.42, y: 681.54))
        shape.line(to: CGPoint(x: 183.24, y: 681.54))
        shape.close()
        shape.move(to: CGPoint(x: 140.74, y: 819.69))
        shape.curve(to: CGPoint(x: 102.39, y: 858.09), controlPoint1: CGPoint(x: 119.55, y: 819.71), controlPoint2: CGPoint(x: 102.38, y: 836.9))
        shape.curve(to: CGPoint(x: 140.78, y: 896.45), controlPoint1: CGPoint(x: 102.4, y: 879.28), controlPoint2: CGPoint(x: 119.59, y: 896.46))
        shape.curve(to: CGPoint(x: 179.15, y: 858.07), controlPoint1: CGPoint(x: 161.97, y: 896.44), controlPoint2: CGPoint(x: 179.15, y: 879.26))
        shape.curve(to: CGPoint(x: 167.9, y: 830.92), controlPoint1: CGPoint(x: 179.15, y: 847.89), controlPoint2: CGPoint(x: 175.1, y: 838.12))
        shape.curve(to: CGPoint(x: 140.74, y: 819.69), controlPoint1: CGPoint(x: 160.69, y: 823.72), controlPoint2: CGPoint(x: 150.92, y: 819.68))
        shape.line(to: CGPoint(x: 140.74, y: 819.69))
        shape.close()
        return shape
    }
    
    static var frontTuners_Bolt: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 371.8, y: 147.18))
        shape.line(to: CGPoint(x: 344.26, y: 147.18))
        shape.line(to: CGPoint(x: 330.49, y: 171))
        shape.line(to: CGPoint(x: 344.26, y: 194.85))
        shape.line(to: CGPoint(x: 371.8, y: 194.85))
        shape.line(to: CGPoint(x: 385.58, y: 171))
        shape.line(to: CGPoint(x: 371.8, y: 147.18))
        shape.close()
        shape.move(to: CGPoint(x: 329.52, y: 285.52))
        shape.line(to: CGPoint(x: 301.97, y: 285.52))
        shape.line(to: CGPoint(x: 288.2, y: 309.37))
        shape.line(to: CGPoint(x: 301.97, y: 333.23))
        shape.line(to: CGPoint(x: 329.52, y: 333.23))
        shape.line(to: CGPoint(x: 343.29, y: 309.37))
        shape.line(to: CGPoint(x: 329.52, y: 285.52))
        shape.close()
        shape.move(to: CGPoint(x: 284.74, y: 423.05))
        shape.line(to: CGPoint(x: 257.2, y: 423.05))
        shape.line(to: CGPoint(x: 243.43, y: 446.9))
        shape.line(to: CGPoint(x: 257.2, y: 470.75))
        shape.line(to: CGPoint(x: 284.74, y: 470.75))
        shape.line(to: CGPoint(x: 298.52, y: 446.9))
        shape.line(to: CGPoint(x: 284.74, y: 423.05))
        shape.close()
        shape.move(to: CGPoint(x: 241.55, y: 559.19))
        shape.line(to: CGPoint(x: 214, y: 559.19))
        shape.line(to: CGPoint(x: 200.23, y: 583.05))
        shape.line(to: CGPoint(x: 214, y: 606.9))
        shape.line(to: CGPoint(x: 241.55, y: 606.9))
        shape.line(to: CGPoint(x: 255.32, y: 583.05))
        shape.line(to: CGPoint(x: 241.55, y: 559.19))
        shape.close()
        shape.move(to: CGPoint(x: 197.02, y: 696.06))
        shape.line(to: CGPoint(x: 169.47, y: 696.06))
        shape.line(to: CGPoint(x: 155.7, y: 719.92))
        shape.line(to: CGPoint(x: 169.47, y: 743.77))
        shape.line(to: CGPoint(x: 197.02, y: 743.77))
        shape.line(to: CGPoint(x: 210.79, y: 719.92))
        shape.line(to: CGPoint(x: 197.02, y: 696.06))
        shape.close()
        shape.move(to: CGPoint(x: 153.52, y: 835.22))
        shape.line(to: CGPoint(x: 125.97, y: 835.22))
        shape.line(to: CGPoint(x: 112.2, y: 859.07))
        shape.line(to: CGPoint(x: 125.97, y: 882.93))
        shape.line(to: CGPoint(x: 153.52, y: 882.93))
        shape.line(to: CGPoint(x: 167.29, y: 859.07))
        shape.line(to: CGPoint(x: 153.52, y: 835.22))
        shape.close()
        return shape
    }

    static var guitar_Strings: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 376.65, y: 174.88))
        shape.line(to: CGPoint(x: 376.65, y: 1539.42))
        shape.line(to: CGPoint(x: 374.91, y: 1539.42))
        shape.line(to: CGPoint(x: 374.91, y: 174.88))
        shape.line(to: CGPoint(x: 376.65, y: 174.88))
        shape.close()
        shape.move(to: CGPoint(x: 332.65, y: 308.88))
        shape.line(to: CGPoint(x: 330.9, y: 308.88))
        shape.line(to: CGPoint(x: 330.9, y: 1539.42))
        shape.line(to: CGPoint(x: 332.65, y: 1539.42))
        shape.line(to: CGPoint(x: 332.65, y: 308.88))
        shape.close()
        shape.move(to: CGPoint(x: 289.57, y: 445.88))
        shape.line(to: CGPoint(x: 287.15, y: 445.88))
        shape.line(to: CGPoint(x: 287.15, y: 1539.42))
        shape.line(to: CGPoint(x: 289.53, y: 1539.42))
        shape.line(to: CGPoint(x: 289.57, y: 445.88))
        shape.close()
        shape.move(to: CGPoint(x: 244.77, y: 579.39))
        shape.line(to: CGPoint(x: 241.98, y: 579.39))
        shape.line(to: CGPoint(x: 241.98, y: 1539.39))
        shape.line(to: CGPoint(x: 244.77, y: 1539.39))
        shape.line(to: CGPoint(x: 244.77, y: 579.39))
        shape.close()
        shape.move(to: CGPoint(x: 201.41, y: 718.39))
        shape.line(to: CGPoint(x: 198.41, y: 718.39))
        shape.line(to: CGPoint(x: 198.41, y: 1539.33))
        shape.line(to: CGPoint(x: 201.41, y: 1539.33))
        shape.line(to: CGPoint(x: 201.41, y: 718.39))
        shape.close()
        shape.move(to: CGPoint(x: 157.87, y: 856.66))
        shape.line(to: CGPoint(x: 153.71, y: 856.66))
        shape.line(to: CGPoint(x: 153.71, y: 1539.42))
        shape.line(to: CGPoint(x: 157.87, y: 1539.42))
        shape.line(to: CGPoint(x: 157.87, y: 856.66))
        shape.close()
        return shape
        
    }
    
    static var stringTree_Base: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 381.15, y: 743.77))
        shape.line(to: CGPoint(x: 327.15, y: 743.77))
        shape.curve(to: CGPoint(x: 324.36, y: 740.98), controlPoint1: CGPoint(x: 325.61, y: 743.77), controlPoint2: CGPoint(x: 324.36, y: 742.52))
        shape.line(to: CGPoint(x: 324.36, y: 713.53))
        shape.curve(to: CGPoint(x: 327.15, y: 710.74), controlPoint1: CGPoint(x: 324.36, y: 711.99), controlPoint2: CGPoint(x: 325.61, y: 710.74))
        shape.line(to: CGPoint(x: 381.15, y: 710.74))
        shape.curve(to: CGPoint(x: 383.94, y: 713.53), controlPoint1: CGPoint(x: 382.69, y: 710.74), controlPoint2: CGPoint(x: 383.94, y: 711.99))
        shape.line(to: CGPoint(x: 383.94, y: 741))
        shape.curve(to: CGPoint(x: 381.15, y: 743.77), controlPoint1: CGPoint(x: 383.93, y: 742.53), controlPoint2: CGPoint(x: 382.68, y: 743.77))
        shape.line(to: CGPoint(x: 381.15, y: 743.77))
        shape.close()
        return shape
    }

    static var stringTree_Bolt: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 355.15, y: 713.27))
        shape.curve(to: CGPoint(x: 341.15, y: 727.27), controlPoint1: CGPoint(x: 347.42, y: 713.27), controlPoint2: CGPoint(x: 341.15, y: 719.54))
        shape.curve(to: CGPoint(x: 355.15, y: 741.27), controlPoint1: CGPoint(x: 341.15, y: 735), controlPoint2: CGPoint(x: 347.42, y: 741.27))
        shape.curve(to: CGPoint(x: 369.15, y: 727.27), controlPoint1: CGPoint(x: 362.88, y: 741.27), controlPoint2: CGPoint(x: 369.15, y: 735))
        shape.curve(to: CGPoint(x: 355.15, y: 713.27), controlPoint1: CGPoint(x: 369.15, y: 719.54), controlPoint2: CGPoint(x: 362.88, y: 713.27))
        shape.close()
        shape.move(to: CGPoint(x: 356.15, y: 728.27))
        shape.line(to: CGPoint(x: 356.15, y: 739.8))
        shape.line(to: CGPoint(x: 354.15, y: 739.8))
        shape.line(to: CGPoint(x: 354.15, y: 728.25))
        shape.line(to: CGPoint(x: 342.58, y: 728.25))
        shape.line(to: CGPoint(x: 342.58, y: 726.25))
        shape.line(to: CGPoint(x: 354.15, y: 726.25))
        shape.line(to: CGPoint(x: 354.15, y: 714.73))
        shape.line(to: CGPoint(x: 356.15, y: 714.73))
        shape.line(to: CGPoint(x: 356.15, y: 726.26))
        shape.line(to: CGPoint(x: 367.67, y: 726.26))
        shape.line(to: CGPoint(x: 367.67, y: 728.26))
        shape.line(to: CGPoint(x: 356.15, y: 728.27))
        shape.close()
        return shape
    }

    static var frontTuners_Peg: NSBezierPath {
        let shape = NSBezierPath()
        shape.move(to: CGPoint(x: 358.52, y: 189.65))
        shape.curve(to: CGPoint(x: 341.76, y: 178.46), controlPoint1: CGPoint(x: 351.19, y: 189.65), controlPoint2: CGPoint(x: 344.57, y: 185.24))
        shape.curve(to: CGPoint(x: 345.69, y: 158.7), controlPoint1: CGPoint(x: 338.95, y: 171.69), controlPoint2: CGPoint(x: 340.5, y: 163.89))
        shape.curve(to: CGPoint(x: 365.45, y: 154.77), controlPoint1: CGPoint(x: 350.87, y: 153.52), controlPoint2: CGPoint(x: 358.67, y: 151.96))
        shape.curve(to: CGPoint(x: 376.64, y: 171.52), controlPoint1: CGPoint(x: 372.22, y: 157.57), controlPoint2: CGPoint(x: 376.64, y: 164.19))
        shape.curve(to: CGPoint(x: 358.52, y: 189.65), controlPoint1: CGPoint(x: 376.64, y: 181.53), controlPoint2: CGPoint(x: 368.53, y: 189.64))
        shape.line(to: CGPoint(x: 358.52, y: 189.65))
        shape.close()
        shape.move(to: CGPoint(x: 316.23, y: 328))
        shape.curve(to: CGPoint(x: 298.1, y: 309.87), controlPoint1: CGPoint(x: 306.22, y: 328), controlPoint2: CGPoint(x: 298.1, y: 319.88))
        shape.curve(to: CGPoint(x: 316.23, y: 291.74), controlPoint1: CGPoint(x: 298.1, y: 299.86), controlPoint2: CGPoint(x: 306.22, y: 291.74))
        shape.curve(to: CGPoint(x: 334.36, y: 309.87), controlPoint1: CGPoint(x: 326.24, y: 291.74), controlPoint2: CGPoint(x: 334.36, y: 299.86))
        shape.curve(to: CGPoint(x: 316.23, y: 328), controlPoint1: CGPoint(x: 334.36, y: 319.88), controlPoint2: CGPoint(x: 326.24, y: 328))
        shape.close()
        shape.move(to: CGPoint(x: 271.46, y: 465.51))
        shape.curve(to: CGPoint(x: 254.7, y: 454.32), controlPoint1: CGPoint(x: 264.13, y: 465.51), controlPoint2: CGPoint(x: 257.51, y: 461.1))
        shape.curve(to: CGPoint(x: 258.63, y: 434.56), controlPoint1: CGPoint(x: 251.89, y: 447.55), controlPoint2: CGPoint(x: 253.44, y: 439.75))
        shape.curve(to: CGPoint(x: 278.39, y: 430.63), controlPoint1: CGPoint(x: 263.82, y: 429.37), controlPoint2: CGPoint(x: 271.62, y: 427.82))
        shape.curve(to: CGPoint(x: 289.58, y: 447.39), controlPoint1: CGPoint(x: 285.17, y: 433.44), controlPoint2: CGPoint(x: 289.58, y: 440.06))
        shape.curve(to: CGPoint(x: 271.46, y: 465.51), controlPoint1: CGPoint(x: 289.57, y: 457.4), controlPoint2: CGPoint(x: 281.47, y: 465.5))
        shape.line(to: CGPoint(x: 271.46, y: 465.51))
        shape.close()
        shape.move(to: CGPoint(x: 228.26, y: 601.66))
        shape.curve(to: CGPoint(x: 211.51, y: 590.47), controlPoint1: CGPoint(x: 220.93, y: 601.66), controlPoint2: CGPoint(x: 214.31, y: 597.24))
        shape.curve(to: CGPoint(x: 215.44, y: 570.71), controlPoint1: CGPoint(x: 208.7, y: 583.69), controlPoint2: CGPoint(x: 210.26, y: 575.89))
        shape.curve(to: CGPoint(x: 235.2, y: 566.78), controlPoint1: CGPoint(x: 220.63, y: 565.52), controlPoint2: CGPoint(x: 228.43, y: 563.97))
        shape.curve(to: CGPoint(x: 246.39, y: 583.54), controlPoint1: CGPoint(x: 241.98, y: 569.59), controlPoint2: CGPoint(x: 246.39, y: 576.21))
        shape.curve(to: CGPoint(x: 241.08, y: 596.36), controlPoint1: CGPoint(x: 246.39, y: 588.35), controlPoint2: CGPoint(x: 244.48, y: 592.96))
        shape.curve(to: CGPoint(x: 228.26, y: 601.66), controlPoint1: CGPoint(x: 237.68, y: 599.75), controlPoint2: CGPoint(x: 233.07, y: 601.66))
        shape.close()
        shape.move(to: CGPoint(x: 183.73, y: 738.53))
        shape.curve(to: CGPoint(x: 165.6, y: 720.4), controlPoint1: CGPoint(x: 173.72, y: 738.53), controlPoint2: CGPoint(x: 165.6, y: 730.41))
        shape.curve(to: CGPoint(x: 183.73, y: 702.27), controlPoint1: CGPoint(x: 165.6, y: 710.39), controlPoint2: CGPoint(x: 173.72, y: 702.27))
        shape.curve(to: CGPoint(x: 201.86, y: 720.4), controlPoint1: CGPoint(x: 193.74, y: 702.27), controlPoint2: CGPoint(x: 201.86, y: 710.39))
        shape.curve(to: CGPoint(x: 183.73, y: 738.53), controlPoint1: CGPoint(x: 201.86, y: 730.41), controlPoint2: CGPoint(x: 193.74, y: 738.53))
        shape.close()
        shape.move(to: CGPoint(x: 139.73, y: 877.68))
        shape.curve(to: CGPoint(x: 122.98, y: 866.49), controlPoint1: CGPoint(x: 132.4, y: 877.68), controlPoint2: CGPoint(x: 125.78, y: 873.26))
        shape.curve(to: CGPoint(x: 126.91, y: 846.73), controlPoint1: CGPoint(x: 120.17, y: 859.71), controlPoint2: CGPoint(x: 121.73, y: 851.91))
        shape.curve(to: CGPoint(x: 146.67, y: 842.8), controlPoint1: CGPoint(x: 132.1, y: 841.54), controlPoint2: CGPoint(x: 139.9, y: 839.99))
        shape.curve(to: CGPoint(x: 157.86, y: 859.56), controlPoint1: CGPoint(x: 153.45, y: 845.61), controlPoint2: CGPoint(x: 157.86, y: 852.23))
        shape.curve(to: CGPoint(x: 139.74, y: 877.68), controlPoint1: CGPoint(x: 157.86, y: 869.57), controlPoint2: CGPoint(x: 149.75, y: 877.68))
        shape.line(to: CGPoint(x: 139.73, y: 877.68))
        shape.close()
        return shape
    }
}


