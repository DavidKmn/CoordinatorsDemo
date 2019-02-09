//
//  Coordinator.swift
//  CoordinatorsDemo(Tab+Nav+Children)
//
//  Created by David on 08/02/2019.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit


protocol Coordinating: class {
    var childCoordinators: [String: Coordinating] { get set }
    func start()
    var identifier: String { get }
    func startChild(_ coordinator: Coordinating)
    func childDidFinish(_ coordinator: Coordinating)
    var parent: Coordinating? { get set }
}

extension Coordinator {
    var identifier: String {
        return String(describing: type(of: self))
    }
}

class Coordinator<T: UIViewController>: NSObject, Coordinating {
    
    var childCoordinators: [String : Coordinating] = [:]
    let rootViewController: T
    open weak var parent: Coordinating?

    init(rootViewController: T) {
        self.rootViewController = rootViewController
    }
    
    func start() { }
    
    func childDidFinish(_ coordinator: Coordinating) {
        coordinator.parent = nil
        childCoordinators.removeValue(forKey: coordinator.identifier)
    }
    
    func startChild(_ coordinator: Coordinating) {
        childCoordinators[coordinator.identifier] = coordinator
        coordinator.parent = self
        coordinator.start()
    }
}

class NavigationCoordinator: Coordinator<UINavigationController>, UINavigationControllerDelegate {
    
    var viewControllers: [UIViewController] = []
    
    override init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
    }
    
    func present(_ vc: UIViewController) {
        rootViewController.present(vc, animated: true, completion: nil)
    }
    
    func push(_ vc: UIViewController) {
        viewControllers.append(vc)
        rootViewController.pushViewController(vc, animated: true)
    }
    
    func pop(to vc: UIViewController) {
        rootViewController.popToViewController(vc, animated: true)
        
        if let index = viewControllers.index(of: vc) {
            let lastPosition = viewControllers.count - 1
            if lastPosition > 0 {
                viewControllers = Array(viewControllers.dropLast(lastPosition - index))
            }
        }
    }
    
    public func popToRoot(_ onCompletion: (() -> Void)?) {
        rootViewController.popToRootViewController(animated: true)
        onCompletion?()
    }
    
    public func dismiss() {
        rootViewController.dismiss(animated: true, completion: nil)
    }
    
    override func start() {
        rootViewController.delegate = self
        super.start()
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        // if contains then we are pushing, if doesnt then we are popping
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        // check if this is a pop
        if let vc = self.viewControllers.last, vc === fromViewController {
            self.viewControllers.removeLast()
        }
        
        if self.viewControllers.isEmpty {
            //    inform the parent Coordinator that this child Coordinator has no more VCs
            self.childDidFinish(self)
            return
        }
    }
}
