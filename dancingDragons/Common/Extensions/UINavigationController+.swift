//
//  UINavigationController+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import UIKit

extension UINavigationController {
    func replaceTopViewController(with viewController: UIViewController, animated: Bool = true) {
        var viewControllers = Array(self.viewControllers.dropLast())
        viewControllers.append(viewController)
        setViewControllers(viewControllers, animated: animated)
    }
    
    func replaceControllerStack(with viewController: UIViewController, animated: Bool = true) {
        setViewControllers([viewController], animated: animated)
    }
}
