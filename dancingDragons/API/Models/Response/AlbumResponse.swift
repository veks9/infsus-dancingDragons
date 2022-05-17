//
//  AlbumResponse.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation

extension Model {
    struct AlbumResponse: Codable, Hashable {
        let _id: String
        let id: Int
        let year: String
        let coverImage: String
        let title: String
        let songIds: [Int]
        let version: Int?
        
        enum CodingKeys: String, CodingKey {
            case _id
            case id
            case coverImage
            case year
            case title
            case songIds
            case version = "__v"
        }
    }
}
