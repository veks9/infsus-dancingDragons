//
//  CustomButton.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 22.05.2022..
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        styleButton()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleButton() {
        clipsToBounds = true
        layer.cornerRadius = 10 
    }
}
