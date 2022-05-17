//
//  CreateArtistRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import Alamofire

struct CreateArtistRequest: APIRequest {
    typealias ResponseType = Model.ArtistResponse
    
    var path: String {
        return Endpoint.createArtist.path
    }
    
    var artist: Model.ArtistBody
    var query: String?
    var httpMethod: HTTPMethod = .post
    var requestBody: Data? {
        artist.data
    }
    var authentificationType: AuthentificationType = .none
}

