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
    var albums: [String]
    let albumService: AlbumServicing
    private let disposeBag = DisposeBag()

    let id: Int
    let title: String
    let artistIds: [Int]
    let albumId: Int
    
    init(id: Int,
         title: String,
         artistIds: [Int],
         albumId: Int
    ){
        self.id = id
        self.title = title
        self.artistIds = artistIds
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
                    self.albums.append(album.title)
                }
            })
            .disposed(by: disposeBag)
    }
}
