//
//  AlbumDetailsViewModel.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 18.05.2022..
//

import Foundation
import UIKit

class AlbumDetailsViewModel {
    let title: String
//    let year: String
    let cover: String?
    //let songs: Model.SongResponse
    
    init(title: String, 
//         year: String,
         cover: String?
    ){
        self.title = title
//        self.year = year
        self.cover = cover
    } 
}
