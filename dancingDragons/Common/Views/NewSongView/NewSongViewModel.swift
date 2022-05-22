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
    let newSongScreenType: NewSongScreenType
    
    init(id: Int,
         title: String,
         albumId: Int,
         newSongScreenType: NewSongScreenType
    ){
        self.id = id
        self.title = title
        self.albumId = albumId
        self.albums = []
        self.albumService = AlbumService()
        self.songService = SongService()
        self.newSongScreenType = newSongScreenType
        fetchAlbums()
    }
    
    func fetchAlbums() {
        albumService.getAlbums()
            .subscribe(onNext: { [weak self] albums in
                guard let self = self else { return }
                albums.forEach { album in
                    self.albums.append((album.title, album.id))
                }
            })
            .disposed(by: disposeBag)
    }
    
    func updateSong(title: String?, albumId: Int) -> Observable<String> {
        songService.updateSong(with: id, song: Model.SongBody(title: title ?? "", albumId: albumId))
    }
    
    func createSong(title: String?, albumId: Int) -> Observable<Model.SongResponse>{
        songService.createSong(song: Model.SongBody(title: title ?? "", albumId: albumId))
    }
}

enum NewSongScreenType {
    case update
    case create
}
