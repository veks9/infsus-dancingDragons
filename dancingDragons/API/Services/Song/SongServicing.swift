//
//  SongServicing.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation
import RxSwift

protocol SongServicing {
    func createSong(song: Model.SongBody) -> Observable<Model.SongResponse>
    func getSongs() -> Observable<[Model.SongResponse]>
    func deleteSong(with id: Int) -> Observable<String>
    func updateSong(with id: Int, song: Model.UpdateSongBody) -> Observable<String>
}
