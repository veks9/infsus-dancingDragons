//
//  APIRequest.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 07.05.2022..
//

import Alamofire
import Foundation
import RxSwift

enum AuthentificationType {
    case none
    case baseAuth
}

protocol APIRequest: URLRequestConvertible {
    associatedtype ResponseType: Decodable
    
    var path: String { get }
    var query: String? { get }
    var httpMethod: HTTPMethod { get }
    var requestBody: Data? { get }
    var authentificationType: AuthentificationType { get }
}

extension APIRequest {
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: path)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.httpBody = requestBody
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}

