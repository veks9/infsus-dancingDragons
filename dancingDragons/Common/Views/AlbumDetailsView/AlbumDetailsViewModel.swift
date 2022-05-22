//
//  AlbumDetailsViewModel.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 18.05.2022..
//

import Foundation
import RxSwift
import RxRelay
import UIKit

class AlbumDetailsViewModel {
    let albumService: AlbumServicing
    private let disposeBag = DisposeBag()

    let id: Int
    let title: String
    let year: String
    let cover: String?
    
    var dataSource: [SongCellType] = []
    var tableViewReloadRelay = PublishRelay<Void>()

    init(id: Int,
         title: String,
         year: String,
         cover: String?,
         albumService: AlbumServicing = AlbumService()
    ){
        self.id = id
        self.title = title
        self.year = year
        self.cover = cover
        self.albumService = albumService
    }
    
    func fetch() {
        albumService.getSongsFromAlbum(with: id)
            .subscribe(onNext: { [weak self] songs in
                guard let self = self else { return }
                self.dataSource = songs.map { song in
                    SongCellType.song(SongCellViewModel(id: song.id,
                                                        title: song.title,
                                                        albumCover: "",
                                                        albumId: song.albumId))
                }
                self.tableViewReloadRelay.accept(())
            })
            .disposed(by: disposeBag)
    }
}
