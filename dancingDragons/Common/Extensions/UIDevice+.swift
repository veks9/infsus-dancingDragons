//
//  UIDevice+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            let safeFrame = window.safeAreaLayoutGuide.layoutFrame
            let bottom = window.frame.maxY - safeFrame.maxY
            return bottom > 0
        } else {
            return false
        }
    }

    var bottomInset: CGFloat? {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            let safeFrame = window.safeAreaLayoutGuide.layoutFrame
            return window.frame.maxY - safeFrame.maxY
        } else {
            return nil
        }
    }

    var topInset: CGFloat? {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows[0].safeAreaLayoutGuide.layoutFrame.minY
        } else {
            return nil
        }
    }
}

