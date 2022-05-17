//
//  FetchAgent.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import Alamofire

struct FetchAgentRequest: APIRequest {
    typealias ResponseType = Model.AgentResponse
    
    var path: String {
        return Endpoint.agent(agentId).path
    }

    let agentId: Int
    var query: String?
    var httpMethod: HTTPMethod = .get
    var requestBody: Data?
    var authentificationType: AuthentificationType = .none
}
