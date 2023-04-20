//
//  HelloModel.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 20.04.2023.
//

import Foundation

struct HelloModel {
    
    private let word = "leohl"
    
    func getResult (userText : String) -> String {
        if userText == word {
            return "Hello!"
        } else {
            return "Try again!"
        }
    }
}
