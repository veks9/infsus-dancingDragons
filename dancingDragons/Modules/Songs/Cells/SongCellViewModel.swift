//
//  SongCellViewModel.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 19.05.2022..
//

import Foundation

class SongCellViewModel {
    let id: Int
    let title: String
    let albumCover: String
    let artistIds: [Int]
    init(
        id: Int,
        title: String,
        albumCover: String,
        artistIds: [Int]
    ) {
        self.id = id
        self.albumCover = albumCover
        self.title = title
        self.artistIds = artistIds
    }
}
