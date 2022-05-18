//
//  AlbumCellViewModel.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 18.05.2022..
//

import Foundation

class AlbumCellViewModel {
    let image: String?
    let title: String
    
    init(
        image: String?,
        title: String
    ) {
        self.image = image
        self.title = title
    }
}
