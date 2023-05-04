//
//  Colors.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 04.05.2023.
//

import UIKit

extension UIColor {
    static var lightyGray = color(hex: "#EEEEEE")
    static var lightBlue = color(hex: "#B8B5FF")
    static var pinky     = color(hex: "#FDB9FC")
    static var turquoise = color(hex: "#99FEFF")
    static var violet    = color(hex: "#B983FF")
    static var dirtyBlue = color(hex: "#3C486B")
    

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
