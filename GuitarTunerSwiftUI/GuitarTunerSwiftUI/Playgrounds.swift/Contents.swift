import Cocoa

//_Guitar_Fretboard
"M399.08,1358 L129.81,1358 L129.81,1122.43 L399.08,1122.43 L399.08,1358 Z M399.08,1374 L129.8,1374 L129.8,1539.47 L399.08,1539.47 L399.08,1374 Z M399.08,1069.28 L129.8,1069.28 L129.8,1093.22 L399.08,1093.22 L399.08,1069.28 Z"

let input = """
let shape = UIBezierPath()shape.move(to: CGPoint(x: 399.08, y: 1358))shape.addLine(to: CGPoint(x: 399.08, y: 1374))shape.addLine(to: CGPoint(x: 129.8, y: 1374))shape.addLine(to: CGPoint(x: 129.8, y: 1358))shape.move(to: CGPoint(x: 129.8, y: 1122.45))shape.addLine(to: CGPoint(x: 399.08, y: 1122.45))shape.addLine(to: CGPoint(x: 399.08, y: 1093.18))shape.addLine(to: CGPoint(x: 129.81, y: 1093.18))shape.addLine(to: CGPoint(x: 129.8, y: 1122.45))shape.close()
"""

let output = input
    .replacingOccurrences(of: "))", with: "))\n")
    .replacingOccurrences(of: "()", with: "()\n")
    .replacingOccurrences(of: "addLine", with: "line")
    .replacingOccurrences(of: "addCurve", with: "curve")
    .replacingOccurrences(of: "UIBezierPath", with: "NSBezierPath")

print(output)
