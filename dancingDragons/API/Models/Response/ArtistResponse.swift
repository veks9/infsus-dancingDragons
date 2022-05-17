//
//  ArtistResponse.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation

extension Model {
    struct ArtistResponse: Codable, Hashable {
        let _id: String
        let userId: Int
        let imageURL: String
        let artistName: String
        let genre: String
        let contract: Int?
        let albums: [Int]
        let version: Int?
        
        enum CodingKeys: String, CodingKey {
            case _id
            case userId
            case imageURL
            case artistName
            case genre
            case contract
            case albums
            case version = "__v"
        }
    }
}
