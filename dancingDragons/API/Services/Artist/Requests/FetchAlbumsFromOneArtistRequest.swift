//
//  FetchAlbumsFromOneArtistRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import Alamofire

struct FetchAlbumsFromOneArtistRequest: APIRequest {
    typealias ResponseType = [Model.AlbumResponse]
    
    var path: String {
        return Endpoint.artist(artistId).path
    }

    let artistId: Int
    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}
