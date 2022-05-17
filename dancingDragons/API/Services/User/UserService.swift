//
//  UserService.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import RxSwift

class UserService: UserServicing {
    func getUser(with id: Int) -> Observable<Model.UserResponse> {
        APIClient.shared.performRequest(FetchUserRequest(userId: id)).asObservable()
    }
}
