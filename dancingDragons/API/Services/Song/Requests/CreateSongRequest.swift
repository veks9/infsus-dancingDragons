//
//  CreateSongRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation
import Alamofire

struct CreateSongRequest: APIRequest {
    typealias ResponseType = Model.SongResponse
    
    var path: String {
        return Endpoint.createSong.path
    }
    
    var song: Model.SongBody
    var query: String?
    var httpMethod: HTTPMethod = .post
    var requestBody: Data? {
        song.data
    }
    var authentificationType: AuthentificationType = .none
}

