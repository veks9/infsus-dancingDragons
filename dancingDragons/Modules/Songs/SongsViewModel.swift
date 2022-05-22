//
//  SongsViewModel.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 19.05.2022..
//

import Foundation
import RxSwift
import RxRelay

class SongsViewModel {
    private let songService: SongServicing
    private let albumService: AlbumServicing
    private let disposeBag = DisposeBag()
    
    var dataSource: [SongCellType] = [] 
    
    var tableViewReloadRelay = PublishRelay<Void>()
    
    init(
        songService: SongServicing = SongService(),
        albumService: AlbumServicing = AlbumService()
    ) {
        self.songService = songService
        self.albumService = albumService
    }
    
    func fetch() {
        songService.getSongs()
            .subscribe(onNext: { [weak self] songs in
                guard let self = self else { return }
                var songs = songs.sorted(by: { $0.albumId ?? 0 < $1.albumId ?? 0 })
                self.dataSource = songs.map { song in
                    SongCellType.song(SongCellViewModel(id: song.id,
                                                        title: song.title,
                                                        albumCover: "",
                                                        artistIds: song.artistIds,
                                                        albumId: song.albumId))
                }
                self.tableViewReloadRelay.accept(())
            })
            .disposed(by: disposeBag)
    }
}

enum SongCellType {
    case song(SongCellViewModel) 
}
