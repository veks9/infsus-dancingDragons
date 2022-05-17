//
//  FetchArtistsByGenre.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import Alamofire

struct FetchArtistsByGenre: APIRequest {
    typealias ResponseType = [Model.ArtistResponse]
    
    var path: String {
        return Endpoint.artistsByGenre(artistId).path
    }
    
    var artistId: Int
    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}

