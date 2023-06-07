//
//  CustomButton.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 06.05.2023.
//

import UIKit

enum CustomButtonState {
    case readAgreement
    case enter
    
    var title: String {
        switch self{
        case .enter:
            return Text.enter
        case .readAgreement:
            return Text.readAgreement
        }
    }
    
    var titleColor: UIColor {
        switch self {
        case .enter, .readAgreement:
            return UIColor.customStrongPink
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .enter, .readAgreement:
            return UIColor.customLightPink
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .enter, .readAgreement:
            return 20
        }
    }
}




final class CustomButton: UIButton {

    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (type: CustomButtonState) {
        setTitle(type.title, for: .normal)
        setTitleColor(type.titleColor, for: .normal)
        backgroundColor = type.backgroundColor
        layer.cornerRadius = type.cornerRadius
    }
    
}
