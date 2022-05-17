//
//  APIClient.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 07.05.2022..
//

import Alamofire
import Foundation
import RxSwift

enum CustomError: Error {
    case parsing
//    case backendCustomError(let errorModel)
    // TODO: - Extend CustomError with backendCustomError
}

extension Error {
    var isCustom: Bool {
        self is CustomError
    }
}

class APIClient {
    static let shared = APIClient()
    
    private init() {}
    
    let decoder = JSONDecoder()
    
    func performRequest<T: APIRequest>(_ request: T) -> Single<T.ResponseType> {
        return Single<T.ResponseType>.create { single -> Disposable in
            AF.request(request)
                .validate()
                .responseDecodable(decoder: self.decoder) { (response: DataResponse<T.ResponseType, AFError>) in
                    print("🔴🔴🔴🔴\(response)🔴🔴🔴🔴")
                    switch response.result {
                    case .success(let value):
                        single(.success(value))
                    case .failure(let afError):

                        if let statusCode = response.response?.statusCode {
                            if statusCode >= 200, statusCode < 300 {
                                single(.failure(CustomError.parsing))
                                return
                            }
                        }

                        guard let parsedError = response.data?.parseError() else {
                            single(.failure(afError))
                            return
                        }
                        single(.failure(parsedError))
                    }
                }
            return Disposables.create()
        }
    }
    
    func performRequestWithEmptyBodyResponse<T: APIRequest>(_ request: T) -> Single<Any?> {
        return Single.create { single -> Disposable in
            AF.request(request)
                .validate()
                .response(completionHandler: { response in
                    switch response.result {
                    case .success(let value):
                        single(.success(value))
                    case .failure(let afError):
                        guard let parsedError = response.data?.parseError() else {
                            single(.failure(afError))
                            return
                        }
                        single(.failure(parsedError))
                    }
                })
            return Disposables.create()
        }
    }
}
