//
//  Colors.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 06.05.2023.
//

import UIKit

extension UIColor {
    
    static let customPink = color(hex: "#FAD4D4")
    static let customLightPink = color(hex: "#FFF2F2")
    static let customMPeachPink = color(hex: "#EF9F9F")
    static let customStrongPink  = color(hex: "#F47C7C")
    

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
