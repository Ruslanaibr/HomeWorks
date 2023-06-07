//
//  CustomLabel.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 06.05.2023.
//

import UIKit

enum CustomLabelState {
    case registration
    case userName
    case userPassword
    case userEmail
    case userNumber
    case acceptUserAgreement
    case userFavouriteFlower
    case numberOfFlowers
    case colorOfFlower
    case userAgreement
    
    var text: String {
        switch self {
        case .registration:
            return Text.registration
        case .userName:
            return Text.userName
        case .userPassword:
            return Text.userPassword
        case .userEmail:
            return Text.userEmail
        case .acceptUserAgreement:
            return Text.acceptUserAgreement
        case .userFavouriteFlower:
            return Text.userFavouriteFlower
        case .numberOfFlowers:
            return Text.numberOfFlowers
        case .colorOfFlower:
            return Text.colorOfFlower
        case .userNumber:
            return Text.userPhoneNumber
        case .userAgreement:
            return Text.userAgreement
        }
    }
    
    var size: CGFloat {
        switch self {
        case .registration:
            return 60
        case .userName, .userEmail, .userPassword, .userFavouriteFlower, .userNumber:
            return 30
        case .numberOfFlowers, .colorOfFlower, .userAgreement:
            return 17
        case .acceptUserAgreement:
            return 27
        }
    }
    
    var font: UIFont {
        switch self {
        case .registration:
            return UIFont(name: "Sacramento", size: self.size)!
        case .userName, .userEmail, .userPassword, .userFavouriteFlower, .acceptUserAgreement, .numberOfFlowers, .colorOfFlower, .userNumber:
            return UIFont(name: "Dancing Script", size: self.size)!
        case .userAgreement:
            return UIFont.systemFont(ofSize: self.size)
        }
    }
    
    var color: UIColor {
        switch self {
        case .registration:
            return UIColor.customStrongPink
        case .userName, .userEmail, .userPassword, .userFavouriteFlower, .acceptUserAgreement, .numberOfFlowers, .colorOfFlower, .userNumber, .userAgreement:
            return UIColor.customMPeachPink
        }
    }
}




final class CustomLabel: UILabel {

    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (type: CustomLabelState) {
        text = type.text
        font = type.font
        textColor = type.color
        numberOfLines = 0
    }
    
}
