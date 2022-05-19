//
//  AlbumCellViewModel.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 18.05.2022..
//

import Foundation

class AlbumCellViewModel {
    let id: Int
    let image: String?
    let title: String
    let year: String
    init(
        id: Int,
        image: String?,
        title: String,
        year: String
    ) {
        self.id = id
        self.image = image
        self.title = title
        self.year = year
    }
}
