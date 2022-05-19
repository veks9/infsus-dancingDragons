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
    
    func fetch(id: Int) {
        albumService.getSongsFromAlbum(with: id)
            .subscribe(onNext: { [weak self] songs in
//                guard let self = self else { return }
                print(songs)
//                self.dataSource = albums.map { album in
//                    AlbumCellType.album(AlbumCellViewModel(image: album.coverImage, title: album.title, year: album.year))
//                }
//                self.tableViewReloadRelay.accept(())
            })
            .disposed(by: disposeBag)
    }
}
