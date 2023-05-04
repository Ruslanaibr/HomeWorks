//
//  TabBarController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 04.05.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addControllersToTabBar()
        view.backgroundColor   = .white
        tabBar.backgroundColor = .turquoise
        tabBar.tintColor       = .violet
    }
    
    
    private func addControllersToTabBar () {
        let weightConfig       = UIImage.SymbolConfiguration(weight: .medium)
        let sizeFontImage      = UIImage(systemName: "character.cursor.ibeam", withConfiguration: weightConfig)!
        let otherSettingsImage = UIImage(systemName: "gear", withConfiguration: weightConfig)!
        
        viewControllers = [generateViewController(rootViewController: ChangeSizeFontViewController(), title: "Size & Font", image: sizeFontImage), generateViewController(rootViewController: OtherSettingsViewController(), title: "Other Settings", image: otherSettingsImage)]

    }
    private func generateViewController (rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC              = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    
    
}
