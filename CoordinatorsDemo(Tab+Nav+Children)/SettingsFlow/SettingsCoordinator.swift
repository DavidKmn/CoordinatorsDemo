//
//  SettingsCoordinator.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 08/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class SettingsCoordinator: NavigationCoordinator, TabCoordinator {
    
    override init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let vc = SettingsViewController()
        vc.coordinator = self
        push(vc)
        super.start()
    }
}

extension SettingsCoordinator: SettingsManager {
    func didSelectSetting(inSection section: Int, atIndex index: Int) {
        let setting = SettingsSection.allCases[section].rows[index]
        let vc = SettingViewController(setting: setting)
        push(vc)
    }
}
