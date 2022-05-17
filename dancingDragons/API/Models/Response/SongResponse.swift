//
//  SongResponse.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation

extension Model {
    struct SongResponse: Codable, Hashable {
        let _id: String
        let id: Int
        let albumId: Int?
        let artistsIds: [Int]
        let title: String
        let version: Int?
        
        enum CodingKeys: String, CodingKey {
            case _id
            case id
            case albumId
            case artistsIds
            case title
            case version = "__v"
        }
    }
}
