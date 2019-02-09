//
//  MainTabBarController.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 08/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

protocol TabCoordinator {
    func setTabBarItem(to tabBarItem: UITabBarItem)
}

extension TabCoordinator where Self: NavigationCoordinator {
    func setTabBarItem(to tabBarItem: UITabBarItem) {
        self.rootViewController.tabBarItem = tabBarItem
    }
}

class MainTabBarController: UITabBarController {
    
    // create all tabs here
    let discover = DiscoverCoordinator(rootViewController: UINavigationController())
    let settings = SettingsCoordinator(rootViewController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discover.start()
        discover.setTabBarItem(to: UITabBarItem(title: "Discover", image: #imageLiteral(resourceName: "search"), selectedImage: nil))
        settings.start()
        settings.setTabBarItem(to: UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "settings"), selectedImage: nil))
        
        viewControllers = [discover.rootViewController, settings.rootViewController]
    }
}
