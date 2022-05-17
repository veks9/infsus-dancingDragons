//
//  FetchArtistsRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import Alamofire

struct FetchArtistsRequest: APIRequest { // TODO: - this one not working
    typealias ResponseType = [Model.ArtistResponse]
    
    var path: String {
        return Endpoint.allArtists.path
    }

    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}
