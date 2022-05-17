//
//  AlbumBody.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation

extension Model {
    struct AlbumBody: Codable, Hashable {
        let title: String
        let year: String
        let coverImage: String
        
        enum CodingKeys: String, CodingKey {
            case title
            case year
            case coverImage
        }
    }
}
