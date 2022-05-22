//
//  NewSongViewModel.swift
//  dancingDragons
//
//  Created by Pero Bokarica on 22.05.2022..
//

import Foundation
import RxSwift
import RxRelay
import UIKit

class NewSongViewModel {
    var albums: [(String, Int)]
    let albumService: AlbumServicing
    private let disposeBag = DisposeBag()

    let id: Int
    let title: String
    let albumId: Int
    
    init(id: Int,
         title: String,
         albumId: Int
    ){
        self.id = id
        self.title = title
        self.albumId = albumId
        self.albums = []
        self.albumService = AlbumService()
        fetchAlbums()
    }
    
    func fetchArtists(id: Int) {
        
    }
    
    func fetchAlbums() {
        albumService.getAlbums()
            .subscribe(onNext: { [weak self] albums in
                guard let self = self else { return }
                albums.map { album in
                    self.albums.append((album.title, album.id))
                }
            })
            .disposed(by: disposeBag)
    }
}
