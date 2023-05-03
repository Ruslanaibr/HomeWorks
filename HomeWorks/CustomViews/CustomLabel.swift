//
//  CustomLabel.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 01.05.2023.
//

import UIKit

enum CustomLabelState {
    case alarmHead
    case sleep
    case noAlarm
    case other
    case alarmLowercase
    case alarmTimeFirst
    case alarmTimeSecond
    case alarmTimeThird
    case whenTimerEnds
    case radar
    
    
    var title : String {
        switch self {
        case .alarmHead, .alarmLowercase:
            return Text.alarmHead
        case .sleep:
            return Text.sleep
        case .noAlarm:
            return Text.noAlarm
        case .other:
            return Text.other
        case .alarmTimeFirst:
            return Text.alarmTimeFirst
        case .alarmTimeSecond:
            return Text.alarmTimeSecond
        case .alarmTimeThird:
            return Text.alarmTimeThird
        case .whenTimerEnds:
            return Text.whenTimerEnds
        case.radar:
            return Text.radar
        }
    }
    
    var textColor : UIColor {
        switch self {
        case .alarmHead, .noAlarm, .other, .sleep, .alarmLowercase, .alarmTimeFirst, .alarmTimeSecond, .alarmTimeThird, .whenTimerEnds, .radar:
            return .white
        }
    }
    
    var size : CGFloat {
        switch self {
        case .alarmHead:
            return 34
        case .sleep, .other:
            return 20
        case .noAlarm, .alarmLowercase, .radar:
            return 17
        case .alarmTimeFirst, .alarmTimeSecond, .alarmTimeThird:
            return 60
        case .whenTimerEnds:
            return 18
        }
    }
    
    var numberOfLines : Int {
        switch self {
        case .alarmHead, .alarmLowercase, .noAlarm, .other, .sleep, .alarmTimeFirst, .alarmTimeSecond, .alarmTimeThird, .whenTimerEnds, .radar:
            return 1
        }
    }
    
    var font : UIFont {
        switch self {
        case .alarmHead, .sleep, .other:
            return .boldSystemFont(ofSize: self.size)
        case .alarmLowercase, .noAlarm, .alarmTimeFirst, .alarmTimeSecond, .alarmTimeThird, .whenTimerEnds, .radar:
            return .systemFont(ofSize: self.size)
        }
    }
}

final class CustomLabel : UILabel {
    
    
    init () {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (type: CustomLabelState) {
        text          = type.title
        textColor     = type.textColor
        numberOfLines = type.numberOfLines
        font          = type.font
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}


