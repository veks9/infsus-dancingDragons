//
//  FetchAlbumsRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 18.05.2022..
//

import Alamofire

struct FetchAlbumsRequest: APIRequest {
    typealias ResponseType = [Model.AlbumResponse]

    
    var path: String {
        return Endpoint.allAlbums.path
    }
    
    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}

