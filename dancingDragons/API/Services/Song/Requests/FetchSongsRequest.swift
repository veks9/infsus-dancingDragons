//
//  FetchSongsRequest.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 19.05.2022..
//

import Alamofire

struct FetchSongsRequest: APIRequest {
    typealias ResponseType = [Model.SongResponse]

    var path: String {
        return Endpoint.allSongs.path
    }
    
    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}
