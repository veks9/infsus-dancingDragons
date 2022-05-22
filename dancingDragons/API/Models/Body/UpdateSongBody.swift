//
//  UpdateSongBody.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 22.05.2022..
//

import Foundation

extension Model {
    struct UpdateSongBody: Codable, Hashable {
        let title: String
        let albumId: Int
        let oldAlbumId: Int
        
        enum CodingKeys: String, CodingKey {
            case title
            case albumId
            case oldAlbumId
        }
    }
}
