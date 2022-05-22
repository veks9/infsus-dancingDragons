//
//  NewSongViewModel.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 22.05.2022..
//

import Foundation
import RxSwift
import RxRelay
import UIKit

class NewSongViewModel {
    var albums: [(String, Int)]
    let albumService: AlbumServicing
    let songService: SongServicing
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
        self.songService = SongService()
        fetchAlbums()
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
    
//    func updateSong() {
//        songService.updateSong(song: new SongBody())()
//            .subscribe(onNext: { [weak self] _ in
//                guard let self = self else { return }
//
//            })
//            .disposed(by: disposeBag)
//    }
}
