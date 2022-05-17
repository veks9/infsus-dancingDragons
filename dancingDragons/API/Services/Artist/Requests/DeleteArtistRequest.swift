//
//  DeleteArtistRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import Alamofire

struct DeleteArtistRequest: APIRequest {
    typealias ResponseType = String
    
    var path: String {
        return Endpoint.deleteArtist(artistId).path
    }
    
    var artistId: Int
    var query: String?
    var httpMethod: HTTPMethod = .delete
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}

