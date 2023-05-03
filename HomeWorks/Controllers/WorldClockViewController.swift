//
//  WorldClockViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 01.05.2023.
//

import UIKit

final class WorldClockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationItems()
    }
    
    private func addNavigationItems () {
        view.backgroundColor = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .orange
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        navigationItem.rightBarButtonItem?.tintColor = .orange
    }

   
}
