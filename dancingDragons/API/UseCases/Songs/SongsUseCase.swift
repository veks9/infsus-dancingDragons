//
//  SongsUseCase.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 22.05.2022..
//

import Foundation
import RxSwift

class SongsUseCase {
    private let disposeBag = DisposeBag()
    private let songService: SongServicing
    
    init(songService: SongServicing = SongService()) {
        self.songService = songService
    }
    
    func fetch() -> Observable<[Model.SongResponse]> {
        songService.getSongs()
    }
    
    func delete(with id: Int) -> Observable<String> {
        songService.deleteSong(with: id)
    }
    
    func update(with id: Int, song: Model.UpdateSongBody) -> Observable<String> {
        songService.updateSong(with: id, song: song)
    }
    
    func create(song: Model.SongBody) -> Observable<Model.SongResponse> {
        songService.createSong(song: song)
    }
}
