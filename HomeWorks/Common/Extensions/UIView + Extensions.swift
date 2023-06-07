//
//  Views.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 06.05.2023.
//

import UIKit

extension UIViewController {
    
    func addSubviews (_ views: UIView...) {
        views.forEach{ view.addSubview($0) }
    }
    
    func addSubviews (_ views: [UIView]) {
        views.forEach{ view.addSubview($0) }
    }
    
    func translateAuthMaskOff (_ views: UIView...) {
        views.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
    }
    
    func translateAuthMaskOff (_ views: [UIView]) {
        views.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
    }
}
