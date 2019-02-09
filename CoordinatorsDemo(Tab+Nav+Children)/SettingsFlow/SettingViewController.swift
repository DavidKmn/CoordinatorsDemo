//
//  SettingViewController.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 09/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    init(setting: SettingsRow) {
        super.init(nibName: nil, bundle: nil)
        title = setting.rawValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


