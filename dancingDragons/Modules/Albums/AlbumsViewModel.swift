//
//  AlbumsViewModel.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 18.05.2022..
//

import Foundation
import RxSwift
import RxRelay

class AlbumsViewModel {
    let albumsUseCase: AlbumsUseCase
    private let disposeBag = DisposeBag()
    var dataSource: [AlbumCellType] = []
    
    var tableViewReloadRelay = PublishRelay<Void>()
    
    init(albumsUseCase: AlbumsUseCase = AlbumsUseCase()) {
        self.albumsUseCase = albumsUseCase
    }
    
    func fetch() {
        albumsUseCase.fetch()
            .subscribe(onNext: { [weak self] albums in
                guard let self = self else { return }
                self.dataSource = albums.map { album in
                    AlbumCellType.album(AlbumCellViewModel(id: album.id, image: album.coverImage, title: album.title, year: album.year))
                }
                self.tableViewReloadRelay.accept(())
            })
            .disposed(by: disposeBag)
    }
}

enum AlbumCellType {
    case album(AlbumCellViewModel)
}
