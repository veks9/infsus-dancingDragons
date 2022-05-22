//
//  AlbumsUseCase.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 22.05.2022..
//

import Foundation
import RxSwift

class AlbumsUseCase {
    private let disposeBag = DisposeBag()
    private let albumService: AlbumServicing
    
    init(albumService: AlbumServicing = AlbumService()) {
        self.albumService = albumService
    }
    
    func fetch() -> Observable<[Model.AlbumResponse]> {
        albumService.getAlbums()
    }
}
