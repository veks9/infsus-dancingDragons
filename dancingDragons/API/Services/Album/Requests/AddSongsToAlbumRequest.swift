//
//  AddSongsToAlbumRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation
import Alamofire

struct AddSongsToAlbumRequest: APIRequest {
    typealias ResponseType = Model.AlbumResponse
    
    var path: String {
        return Endpoint.addSongsToAlbum(albumId).path
    }
    
    var albumId: Int
    var songIds: [Int]
    var query: String?
    var httpMethod: HTTPMethod = .post
    var requestBody: Data? {
        songIds.data
    }
    var authentificationType: AuthentificationType = .none
}

