//
//  BuyCoordinator.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 08/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class BuyCoordinator: NavigationCoordinator, TabCoordinator {
    
    var productTitle: String? = nil
    
    convenience init(productTitle: String, rootViewController: UINavigationController) {
        self.init(rootViewController: rootViewController)
        self.productTitle = productTitle
    }
    
    override init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let vc = BuyViewController()
        vc.coordinator = self
        vc.setupBottomButton(with: productTitle == nil ? "Buy" : ("Buy " + productTitle!))
        vc.setPaymentMethods(withTitles: PaymentMethod.allCases.map { $0.rawValue })
        push(vc)
        super.start()
    }

}
