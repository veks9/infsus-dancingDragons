//
//  CreateAlbumRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation
import Alamofire

struct CreateAlbumRequest: APIRequest {
    typealias ResponseType = Model.AlbumResponse
    
    var path: String {
        return Endpoint.createAlbum.path
    }
    
    let album: Model.AlbumBody
    var query: String?
    var httpMethod: HTTPMethod = .post
    var requestBody: Data? {
        album.data
    }
    var authentificationType: AuthentificationType = .none
}

