//
//  AgentService.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import RxSwift

class AgentService {
    func getAgent(with id: Int) -> Observable<Model.AgentResponse> {
        APIClient.shared.performRequest(FetchAgentRequest(agentId: id)).asObservable()
    }
}
