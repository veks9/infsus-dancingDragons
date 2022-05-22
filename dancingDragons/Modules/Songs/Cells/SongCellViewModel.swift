//
//  SongCellViewModel.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 19.05.2022..
//

import Foundation
import RxSwift

class SongCellViewModel {
    let id: Int
    let title: String
    let albumCover: String
    let albumId: Int?
    
    init(
        id: Int,
        title: String,
        albumCover: String,
        albumId: Int?
    ) {
        self.id = id
        self.albumCover = albumCover
        self.title = title
        self.albumId = albumId
    }
}
