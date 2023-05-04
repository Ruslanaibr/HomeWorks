//
//  CustomLabel.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 04.05.2023.
//

import UIKit


enum CustomLabelState {
    case size
    case font
    case numberOfLines
    case color
    case shadows
    case label
    
    var text: String {
        switch self {
        case .size:
            return Text.size
        case .font:
            return Text.font
        case .numberOfLines:
            return Text.numberOfLines
        case .color:
            return Text.color
        case .shadows:
            return Text.shadows
        case .label:
            return Text.label
        }
    }
    
    var size: CGFloat {
        switch self {
        case .color, .font, .numberOfLines, .shadows, .size:
            return 20
        case .label:
            return 30
        }
    }
    
    var font: UIFont {
        switch self {
        case .color, .font, .numberOfLines, .shadows, .size, .label:
            return UIFont(name: "CastoroTitling-Regular", size: self.size)!
        }
    }
    
    var numberOfLines: Int {
        switch self {
        case .color, .font, .numberOfLines, .shadows, .size:
            return 1
        case .label:
            return 0
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .color, .font, .numberOfLines, .shadows, .size:
            return 0
        case .label:
            return 1
        }
    }
    
    var alignment: NSTextAlignment {
        switch self {
        case .color, .font, .numberOfLines, .shadows, .size:
            return .left
        case .label:
            return .center
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
        numberOfLines = type.numberOfLines
        layer.borderWidth = type.borderWidth
        textAlignment = type.alignment
    }
}
