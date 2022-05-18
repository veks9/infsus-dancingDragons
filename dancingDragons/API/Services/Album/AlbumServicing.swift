//
//  AlbumServicing.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation
import RxSwift

protocol AlbumServicing {
    func getSongsFromAlbum(with id: Int) -> Observable<[Model.SongResponse]>
    func createAlbum(album: Model.AlbumBody) -> Observable<Model.AlbumResponse>
    func addSongsToAlbum(albumId: Int, songIds: [Int]) -> Observable<Model.AlbumResponse>
    func getAlbums() -> Observable<[Model.AlbumResponse]>
}
