//
//  FetchUserRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import Alamofire

struct FetchUserRequest: APIRequest {
    typealias ResponseType = Model.UserResponse
    
    var path: String {
        return Endpoint.user(userId).path
    }

    let userId: Int
    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}
