//
//  BuyViewController.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 08/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {
    
    weak var coordinator: BuyCoordinator?
    
    private lazy var paymentMethodSelectionSegmentedControl: UISegmentedControl = { [unowned self] in
        let segmentedControl = UISegmentedControl()
        segmentedControl.addTarget(self, action: #selector(handleProductChange(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
        }()
    
    private lazy var buyButton: UIButton = { [unowned self] in
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleBuyProductTap), for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 0.6
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate func setupSubviews() {
        view.addSubview(paymentMethodSelectionSegmentedControl)
        view.addSubview(buyButton)
        
        NSLayoutConstraint.activate([
            paymentMethodSelectionSegmentedControl.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 20),
            paymentMethodSelectionSegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            paymentMethodSelectionSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buyButton.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -20),
            buyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupSubviews()
    }
    
    @objc fileprivate func handleProductChange(_ segmentedControl: UISegmentedControl) {
    }
    
    @objc fileprivate func handleBuyProductTap() {
    }
    
    func setupBottomButton(with title: String, color: UIColor = .blue) {
        buyButton.setTitle(title, for: .normal)
        buyButton.setTitleColor(color, for: .normal)
    }
    
    func setPaymentMethods(withTitles titles: [String]) {
        titles.enumerated().forEach { (arg) in
            let (idx, title) = arg
            self.paymentMethodSelectionSegmentedControl.insertSegment(withTitle: title, at: idx, animated: false)
        }
    }
}
