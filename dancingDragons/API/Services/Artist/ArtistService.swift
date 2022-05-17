//
//  ArtistService.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import RxSwift
import Alamofire

final class ArtistService: ArtistServicing {
    
    func getArtists() -> Observable<[Model.ArtistResponse]> {
        APIClient.shared.performRequest(FetchArtistsRequest()).asObservable()
    }
    
    func getArtist(with id: Int) -> Observable<Model.ArtistResponse> {
        APIClient.shared.performRequest(FetchArtistRequest(artistId: id)).asObservable()
    }
    
    func getAlbumsFromArtist(with id: Int) -> Observable<[Model.AlbumResponse]> {
        APIClient.shared.performRequest(FetchAlbumsFromOneArtistRequest(artistId: id)).asObservable()
    }
    
    func createArtist(artist: Model.ArtistBody) -> Observable<Model.ArtistResponse> {
        APIClient.shared.performRequest(CreateArtistRequest(artist: artist)).asObservable()
    }}
