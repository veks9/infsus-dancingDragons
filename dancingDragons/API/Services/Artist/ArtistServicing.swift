//
//  ArtistServicing.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import RxSwift

protocol ArtistServicing {
    func getArtists() -> Observable<[Model.ArtistResponse]>
    func getArtist(with id: Int) -> Observable<Model.ArtistResponse>
    func getAlbumsFromArtist(with id: Int) -> Observable<[Model.AlbumResponse]>
}
