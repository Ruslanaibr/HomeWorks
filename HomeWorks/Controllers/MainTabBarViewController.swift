//
//  MainTabBarViewController.swift
//  HomeWorks
//
//  Created by Руслана ибрагимова on 01.05.2023.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .black
        tabBar.barTintColor    = .black
        tabBar.tintColor       = .orange
        
        addNavigationVCtoTabVC()
    }
    
    private func addNavigationVCtoTabVC () {
        let worldClockViewController = WorldClockViewController()
        let alarmViewController      = AlarmViewController()
        let stopwatchViewConroller   = StopwatchViewController()
        let timerViewController      = TimerViewController()
        
        let weightCongig    = UIImage.SymbolConfiguration(weight: .medium)
        let worldClockImage = UIImage(systemName: "globe", withConfiguration: weightCongig)!
        let alarmImage      = UIImage(systemName: "alarm.fill", withConfiguration: weightCongig)!
        let stopWatchImage  = UIImage(systemName: "stopwatch.fill", withConfiguration: weightCongig)!
        let timerImage      = UIImage(systemName: "timer", withConfiguration: weightCongig)!
        
        viewControllers = [
            generateViewController(rootViewController: worldClockViewController, title: "World Clock", image: worldClockImage),
            generateViewController(rootViewController: AlarmViewController(), title: "Alarm", image: alarmImage),
            generateViewController(rootViewController: StopwatchViewController(), title: "Stopwatch", image: stopWatchImage),
            generateViewController(rootViewController: TimerViewController(), title: "Timer", image: timerImage)]
    }
    
    private func generateViewController (rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC              = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    


}
