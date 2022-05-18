//
//  UIImageView+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 18.05.2022..
//

import Kingfisher
import UIKit

extension UIImageView {
    func setImage(_ urlString: String?) {
        guard let urlString = urlString else { return }
        kf.setImage(with: urlString.toURL())
    }
}
