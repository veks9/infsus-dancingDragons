//
//  String+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation

extension String {
    var isBlank: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

extension String {
    func toURL() -> URL? {
        URL(string: self)
    }
}
