//
//  FetchAlbumById.swift
//  dancingDragons
//
//  Created by Luka Bokarica on 19.05.2022..
//

import Alamofire

struct FetchAlbumRequest: APIRequest {
    typealias ResponseType = Model.AlbumResponse
    
    var path: String {
        return Endpoint.album(albumId).path
    }

    let albumId: Int
    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}
