//
//  CustomTextField.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 06.05.2023.
//

import UIKit


enum CustomTextFieldState {
    case name
    case password
    case favouriteFlowers
    case email
    case number
    
    var placeholder: String {
        switch self {
        case .email:
            return Text.emailPlaceholder
        case .name:
            return Text.namePlaceholder
        case .password:
            return Text.passwordPlaceholder
        case .favouriteFlowers:
            return Text.favouriteFlowersPlaceholder
        case .number:
            return Text.phoneNumberPlaceholder
        }
    }
    
    var isSecuretextEntry: Bool {
        switch self {
        case .email, .name, .favouriteFlowers, .number:
            return false
        case .password:
            return true
        }
    }
    
    var clearButtonMode: UITextField.ViewMode {
        switch self {
        case .email, .name, .favouriteFlowers, .password, .number:
            return .always
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress
        case .number:
            return .numberPad
        case .password, .favouriteFlowers, .name:
            return .default
        }
    }
    
    var returnKeyType: UIReturnKeyType {
        switch self {
        case .email, .name, .favouriteFlowers, .password:
            return .next
        case .number:
            return .done
        }
    }
    
    var borderStyle: UITextField.BorderStyle {
        switch self {
        case .email, .name, .favouriteFlowers, .password, .number:
            return .roundedRect
        }
    }
}
    
final class CustomTextField: UITextField {
    
    init () {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure (type: CustomTextFieldState) {
        placeholder = type.placeholder
        isSecureTextEntry = type.isSecuretextEntry
        clearButtonMode = type.clearButtonMode
        keyboardType    = type.keyboardType
        returnKeyType = type.returnKeyType
        borderStyle = type.borderStyle
    }
}


