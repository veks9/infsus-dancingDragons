//
//  UIButton+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import UIKit

extension UIButton {
    
    func setEnabled() {
        isEnabled = true
        isUserInteractionEnabled = true
        alpha = 1
    }
    
    func setDisabled() {
        isEnabled = false
        isUserInteractionEnabled = false
        alpha = 0.5
    }
}
