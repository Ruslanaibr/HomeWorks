//
//  LabelSettings.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 04.05.2023.
//

import UIKit

class LabelSettings {
    
    private static var uniqueInstance: LabelSettings?
    private init () {}
    
    static func shared() -> LabelSettings {
        if uniqueInstance == nil {
            uniqueInstance = LabelSettings()
        }
        return uniqueInstance!
    }
    
    var isShadowOn: Bool = false
    var color: UIColor = .black
    var numberOfLines: Int = 0
}
