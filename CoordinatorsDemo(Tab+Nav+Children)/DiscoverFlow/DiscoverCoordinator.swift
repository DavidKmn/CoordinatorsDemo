//
//  MainCoordinator.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 08/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class DiscoverCoordinator: NavigationCoordinator, TabCoordinator {
    
    // Using dummy data, in real app would have remotely fetched data
    let products = ["Product1", "Product2", "Product3"]
    var currentProductNumber: Int? = nil
    
    override init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let vc = DiscoverViewController()
        vc.discoveryItems = products
        vc.coordinator = self
        push(vc)
        super.start()
    }
}

extension DiscoverCoordinator: Discovering {
    func detailForProduct(at index: Int) {
        let vc = ProductDetailViewController(name: self.products[index])
        vc.coordinator = self
        self.currentProductNumber = index
        push(vc)
    }
}

extension DiscoverCoordinator: Buying {
    func buyProduct() {
        popToRoot { [weak self] in
            guard let self = self else { return }
            let buyCoordinator = BuyCoordinator(rootViewController: self.rootViewController)
            buyCoordinator.productTitle = self.products[self.currentProductNumber!]
            self.startChild(buyCoordinator)
        }
    }
}
