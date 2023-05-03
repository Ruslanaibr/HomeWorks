//
//  CustomButton.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 03.05.2023.
//

import UIKit

enum CustomButtonState {
    case start
    case cancel
    
    var title : String {
        switch self {
        case .start:
            return Text.startButton
        case .cancel:
            return Text.cancelButton
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .start:
            return .neonGreen
        case .cancel:
            return .darkGray
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .start:
            return .lightGreen
        case .cancel:
            return .lightGray
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .start, .cancel:
            return 45
        }
    }
}

final class CustomButton : UIButton {
    
    init() {
        super.init(frame: .zero)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (type: CustomButtonState) {
        setTitle(type.title, for: .normal)
        setTitleColor(type.textColor, for: .normal)
        backgroundColor = type.backgroundColor
        layer.cornerRadius = type.cornerRadius
    }
}
