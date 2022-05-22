//
//  CustomTextField.swift
//  dancingDragons
//
//  Created by Pero Bokarica on 22.05.2022..
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    weak var nextTextField: UITextField?
    
    init() {
        super.init(frame: .zero)
        styleTextField()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleTextField() { 
        textColor = .white
        backgroundColor = .darkGray
        layer.cornerRadius = 10
        setLeftInset(15)
        setRightInset(15)
        delegate = self
    }
}

// MARK: - UITextFieldDelegate

extension CustomTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let nextTextField = nextTextField else {
                return textField.resignFirstResponder()
            }
            return nextTextField.becomeFirstResponder()
        }
}
