//
//  FetchSongsFromAlbum.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 10.05.2022..
//

import Foundation
import Alamofire

struct FetchSongsFromAlbum: APIRequest {
    typealias ResponseType = [Model.SongResponse]
    
    var path: String {
        return Endpoint.songsFromAlbum(albumId).path
    }

    let albumId: Int
    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}
