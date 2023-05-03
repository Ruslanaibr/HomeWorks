//
//  CustomView.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 02.05.2023.
//

import UIKit

enum CustomImageState {
    case separator
    
    var image : UIImage? {
        switch self {
        case .separator:
            return UIImage(named: ImageName.separator)
        }
    }
    
    var contentMode: UIView.ContentMode {
        switch self {
        case .separator:
            return .scaleAspectFit
        }
    }
}

final class CustomImage : UIImageView {
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (type: CustomImageState) {
        translatesAutoresizingMaskIntoConstraints = false
        image       = type.image
    }
}
