//
//  UITableView+extensions.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 09/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell(ofType type: UITableViewCell.Type) {
        register(type, forCellReuseIdentifier: type.reuseID)
    }
    
    func deqeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as! Cell
    }
}
