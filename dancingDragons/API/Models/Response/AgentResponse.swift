//
//  AgentResponse.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation

extension Model {
    struct AgentResponse: Codable, Hashable {
        let _id: String
        let id: Int
        let contractId: Int
        let artistId: Int
        let version: Int?
        
        enum CodingKeys: String, CodingKey {
            case _id
            case id
            case contractId
            case artistId
            case version = "__v"
        }
    }
}
