//
//  ProductViewController.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 08/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    weak var coordinator: Buying?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "BUY", style: .plain, target: self, action: #selector(handleBuyTap(_:)))
    }

    init(name: String) {
        super.init(nibName: nil, bundle: nil)
        title = name
    }
    
    @objc fileprivate func handleBuyTap(_ barButtonItem: UIBarButtonItem) {
        coordinator?.buyProduct()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
