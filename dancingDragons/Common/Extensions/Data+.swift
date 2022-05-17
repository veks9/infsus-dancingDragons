//
//  Data+.swift
//  dancingDragons
//
//  Created by Vedran Hernaus on 07.05.2022..
//

import Foundation

// Error
extension Data {
    func parseError() -> NSError {
        let data = self
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
              let dict = json as? [String: Any]
        else {
            return NSError(domain: "", code: 0, userInfo: nil)
        }
        let code = dict["resultType"] as? Int ?? 0
        let message = dict["errorMessage"] as? String ?? ""
        return NSError(domain: message, code: code, userInfo: nil)
    }
}
