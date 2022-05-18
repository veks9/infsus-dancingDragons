//
//  AlbumService.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation
import RxSwift

class AlbumService: AlbumServicing {
    func getSongsFromAlbum(with id: Int) -> Observable<[Model.SongResponse]> {
        APIClient.shared.performRequest(FetchSongsFromAlbum(albumId: id)).asObservable()
    }
    
    func createAlbum(album: Model.AlbumBody) -> Observable<Model.AlbumResponse> {
        APIClient.shared.performRequest(CreateAlbumRequest(album: album)).asObservable()
    }
    
    func addSongsToAlbum(albumId: Int, songIds: [Int]) -> Observable<Model.AlbumResponse> {
        APIClient.shared.performRequest(AddSongsToAlbumRequest(albumId: albumId, songIds: songIds)).asObservable()
    }
    
    func getAlbums() -> Observable<[Model.AlbumResponse]> {
        APIClient.shared.performRequest(FetchAlbumsRequest()).asObservable()
    }
}
