//
//  SongCellViewModel.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 19.05.2022..
//

import Foundation
import RxSwift

class SongCellViewModel {
    let albumService: AlbumServicing
    private let disposeBag = DisposeBag()

    let id: Int
    let title: String
    let albumId: Int
    let artistIds: [Int]
    init(
        id: Int,
        title: String,
        albumId: Int,
        artistIds: [Int],
        albumService: AlbumServicing = AlbumService()
    ) {
        self.id = id
        self.albumId = albumId
        self.title = title
        self.artistIds = artistIds
        self.albumService = albumService
    }
}
