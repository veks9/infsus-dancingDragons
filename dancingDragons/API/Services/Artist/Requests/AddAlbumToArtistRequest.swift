//
//  AddAlbumToArtistRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import Alamofire

struct AddAlbumToArtistRequest: APIRequest {
    typealias ResponseType = Model.ArtistResponse
    
    var path: String {
        return Endpoint.addAlbumToArtist(artistId).path
    }
    
    var artistId: Int
    var albumId: Int
    var query: String?
    var httpMethod: HTTPMethod = .post
    var requestBody: Data? {
        albumId.data
    }
    var authentificationType: AuthentificationType = .none
}

