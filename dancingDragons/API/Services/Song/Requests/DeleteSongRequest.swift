//
//  DeleteSongRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 22.05.2022..
//

import Alamofire

struct DeleteSongRequest: APIRequest {
    typealias ResponseType = String
    
    var path: String {
        return Endpoint.deleteSong(songId).path
    }
    
    let songId: Int
    var query: String?
    var httpMethod: HTTPMethod = .delete
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}

