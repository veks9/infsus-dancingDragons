//
//  User.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation

extension Model {
    struct UserResponse: Codable, Hashable {
        let _id: String
        let id: Int
        let firstName: String
        let lastName: String
        let dateOfBirth: String
        let username: String
        let password: String
        let version: Int?
        
        enum CodingKeys: String, CodingKey {
            case _id
            case id
            case firstName
            case lastName
            case dateOfBirth
            case username
            case password
            case version = "__v"
        }
    }
}
