//
//  SongsViewModel.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 19.05.2022..
//


import Foundation
import RxSwift
import RxRelay
import CloudKit

class SongsViewModel {
    private let songsUseCase: SongsUseCase
    private let disposeBag = DisposeBag()
    
    var dataSource: [SongCellType] = []
    var filteredData: [SongCellType] = []
    
    var tableViewReloadRelay = PublishRelay<Void>()
    var fetchRelay = PublishRelay<Void>()
    
    init(
        songsUseCase: SongsUseCase = SongsUseCase()
    ) {
        self.songsUseCase = songsUseCase
    }
    
    func fetch() {
        songsUseCase.fetch()
            .subscribe(onNext: { [weak self] songs in
                guard let self = self else { return }
                let songs = songs.sorted(by: { $0.albumId ?? 0 < $1.albumId ?? 0 })
                self.dataSource = songs.map { song in
                    SongCellType.song(SongCellViewModel(id: song.id,
                                                        title: song.title,
                                                        albumCover: "",
                                                        albumId: song.albumId))
                }
                self.filteredData = self.dataSource
                self.tableViewReloadRelay.accept(())
            })
            .disposed(by: disposeBag)
    }
    
    func deleteSong(with id: Int) {
        songsUseCase.delete(with: id)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.dataSource.removeAll { songType in
                    switch songType {
                    case .song(let viewModel):
                        return viewModel.id == id
                    }
                }
                
                self.filteredData.removeAll { songType in
                    switch songType {
                    case .song(let viewModel):
                        return viewModel.id == id
                    }
                }
                self.tableViewReloadRelay.accept(())
            })
            .disposed(by: disposeBag)
    }
    
    func updateSong(with id: Int, song: Model.UpdateSongBody) {
        songsUseCase.update(with: id, song: song)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.tableViewReloadRelay.accept(())
            })
            .disposed(by: disposeBag)
    }
}

enum SongCellType {
    case song(SongCellViewModel)
}
