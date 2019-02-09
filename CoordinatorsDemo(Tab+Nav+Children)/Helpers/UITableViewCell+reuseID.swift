//
//  UITableViewCell+helpers.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 09/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

protocol Reusable {}

extension Reusable {
    static var reuseID: String { return String(describing: self) }
}

extension UITableViewCell: Reusable {}
