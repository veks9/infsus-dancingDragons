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
    let albumsUseCase: AlbumsUseCase
    let songsUseCase: SongsUseCase
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
        self.albumsUseCase = AlbumsUseCase()
        self.songsUseCase = SongsUseCase()
        self.newSongScreenType = newSongScreenType
        fetchAlbums()
    }
    
    func fetchAlbums() {
        albumsUseCase.fetch()
            .subscribe(onNext: { [weak self] albums in
                guard let self = self else { return }
                albums.forEach { album in
                    self.albums.append((album.title, album.id))
                }
            })
            .disposed(by: disposeBag)
    }
    
    func updateSong(title: String?, albumId: Int, oldAlbumId: Int) -> Observable<String> {
        songsUseCase.update(with: id, song: Model.UpdateSongBody(title: title ?? "", albumId: albumId, oldAlbumId: oldAlbumId))
    }
    
    func createSong(title: String?, albumId: Int) -> Observable<Model.SongResponse>{
        songsUseCase.create(song: Model.SongBody(title: title ?? "", albumId: albumId))
    }
}

enum NewSongScreenType {
    case update
    case create
}
