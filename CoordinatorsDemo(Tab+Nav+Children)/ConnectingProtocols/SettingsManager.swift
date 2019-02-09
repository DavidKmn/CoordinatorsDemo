//
//  SettingsManager.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 09/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

protocol SettingsManager: class {
    func didSelectSetting(inSection section: Int, atIndex index: Int)
}
