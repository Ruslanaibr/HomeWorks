//
//  Colors.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 03.05.2023.
//

import UIKit

extension UIColor {
    static var lightGray: UIColor {return color(hex: "#525256")}
    static var darkGray: UIColor { return color(hex: "#151517")}
    static var darkGreen: UIColor {return color(hex: "#020e03")}
    static var lightGreen: UIColor {return color(hex: "#275728")}
    static var neonGreen: UIColor {return color(hex: "#0a240c")}
    

    private static func color(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hex, alpha: alpha)
    }

    convenience init(_ hex: String, alpha: CGFloat) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        self.init(red: CGFloat((rgb & 0xFF0000)>>16)/255.0,
                  green: CGFloat((rgb & 0x00FF00)>>8)/255.0,
                  blue: CGFloat(rgb & 0x0000FF)/255.0,
                  alpha: alpha)
        
    }
}
