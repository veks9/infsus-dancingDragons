//
//  UpdateSongRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 22.05.2022..
//

import Alamofire

struct UpdateSongRequest: APIRequest {
    typealias ResponseType = String
    
    var path: String {
        return Endpoint.updateSong(songId).path
    }
    
    let songId: Int
    var query: String?
    var httpMethod: HTTPMethod = .post
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}

