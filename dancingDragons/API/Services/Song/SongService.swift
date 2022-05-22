//
//  SongService.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation
import RxSwift

class SongService: SongServicing {
    func createSong(song: Model.SongBody) -> Observable<Model.SongResponse> {
        APIClient.shared.performRequest(CreateSongRequest(song: song)).asObservable()
    }
    
    func getSongs() -> Observable<[Model.SongResponse]> {
        APIClient.shared.performRequest(FetchSongsRequest()).asObservable()
    }
    
    func deleteSong(with id: Int) -> Observable<String> {
        APIClient.shared.performRequest(DeleteSongRequest(songId: id)).asObservable()
    }
}
