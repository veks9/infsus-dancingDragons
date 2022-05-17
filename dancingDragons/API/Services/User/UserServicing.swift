//
//  UserServicing.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 08.05.2022..
//

import Foundation
import RxSwift

protocol UserServicing {
    func getUser(with id: Int) -> Observable<Model.UserResponse>
}
