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
    let songService: SongServicing
    private let disposeBag = DisposeBag()
    var dataSource: [SongCellType] = [] 
    
    var tableViewReloadRelay = PublishRelay<Void>()
    
    init(songService: SongServicing = SongService()) {
        self.songService = songService
    }
    
    func fetch() {
        songService.getSongs()
            .subscribe(onNext: { [weak self] songs in
                guard let self = self else { return }
                self.dataSource = songs.map { song in
                    SongCellType.song(SongCellViewModel(id: song.id, title: song.title, albumCover: "", artistIds: song.artistIds))
                }
                self.tableViewReloadRelay.accept(())
            })
            .disposed(by: disposeBag)
    }
}

enum SongCellType {
    case song(SongCellViewModel) 
}
