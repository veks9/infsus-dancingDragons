//
//  FetchArtist.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import Alamofire

struct FetchArtistRequest: APIRequest {
    typealias ResponseType = Model.ArtistResponse
    
    var path: String {
        return Endpoint.artist(artistId).path
    }

    let artistId: Int
    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}
