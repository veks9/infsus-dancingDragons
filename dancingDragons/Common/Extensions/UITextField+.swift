//
//  UITextField+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import UIKit

extension UITextField {
    func setLeftInset(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }

    func setRightInset(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        rightView = paddingView
        rightViewMode = .always
    }
}

extension UITextField {
    func updatePlaceHolderWith(string: String, fontColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: string,
            attributes: [NSAttributedString.Key.foregroundColor: fontColor]
        )
    }
}

extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil) {
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: onDone.action, for: .touchUpInside)
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(customView: button)
            
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }

    @objc func doneButtonTapped() { self.resignFirstResponder() }
}
