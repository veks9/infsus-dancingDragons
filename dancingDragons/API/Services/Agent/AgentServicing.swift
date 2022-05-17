//
//  AgentServicing.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import RxSwift

protocol AgentServicing {
    func getAgent(with id: Int) -> Observable<Model.AgentResponse>
}
