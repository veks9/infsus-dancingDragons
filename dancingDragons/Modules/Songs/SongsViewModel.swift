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
    private let songService: SongServicing
    private let albumService: AlbumServicing
    private let disposeBag = DisposeBag()
    
    var dataSource: [SongCellType] = []
    var filteredData: [SongCellType] = []
    
    var tableViewReloadRelay = PublishRelay<Void>()
    
    init(
        songService: SongServicing = SongService(),
        albumService: AlbumServicing = AlbumService()
    ) {
        self.songService = songService
        self.albumService = albumService
    }
    
    func fetch() {
        songService.getSongs()
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
        songService.deleteSong(with: id)
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
    
    func updateSong(with id: Int, song: Model.SongBody) {
        songService.updateSong(with: id, song: song)
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
