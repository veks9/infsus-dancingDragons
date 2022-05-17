//
//  ArtistBody.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 11.05.2022..
//

import Foundation

extension Model {
    struct ArtistBody: Codable, Hashable {
        let firstName: String
        let lastName: String
        let dateOfBirth: String
        let artistName: String
        let imageURL: String
        let genre: String
        
        enum CodingKeys: String, CodingKey {
            case firstName
            case lastName
            case dateOfBirth
            case artistName
            case imageURL
            case genre
        }
    }
}
