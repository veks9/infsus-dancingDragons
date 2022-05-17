//
//  UIView+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import UIKit

extension UIView {
    func parentViewController() -> UIViewController? {
        if let nextResponder = next as? UIViewController {
            return nextResponder
        } else if let nextResponder = next as? UIView {
            return nextResponder.parentViewController()
        } else {
            return nil
        }
    }
}

protocol Identifiable {
    static var identity: String { get }
}

extension UIView: Identifiable {
    static var identity: String {
        return String(describing: self)
    }
}
