//
//  NetworkConstants.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 07.05.2022..
//

import Foundation

struct NetworkConstants {
    static let baseURL = URL(string: baseURLString)!

    // MARK: - Private

    static var baseURLString: String {
        switch Environment.current {
        case .dev:
            return "https://infsus-projekt.herokuapp.com"
        case .production:
            return "https://infsus-projekt.herokuapp.com"
        }
    }
}

enum Environment {
    case dev
    case production
    
#if DEBUG
    static let isDebug = true
#else
    static let isDebug = false
#endif
    
#if PRODUCTION
    static let current = Environment.production
#else
    static let current = Environment.dev
#endif
}
