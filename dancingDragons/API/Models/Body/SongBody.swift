//
//  SongBody.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation

extension Model {
    struct SongBody: Codable, Hashable {
        let title: String
        let albumId: Int
        
        enum CodingKeys: String, CodingKey {
            case title
            case albumId
        }
    }
}
