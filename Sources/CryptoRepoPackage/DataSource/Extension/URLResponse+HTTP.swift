//
//  URLResponse+HTTP.swift
//  CryptoRepoPackage
//
//  Created by Marcelo Mogrovejo on 03/09/2024.
//

import Foundation

extension URLResponse {
    /// Returns casted `HTTPURLResponse`
    var http: HTTPURLResponse? {
        return self as? HTTPURLResponse
    }
}

extension HTTPURLResponse {
    /// Returns `true` if `statusCode` is in range 200...299.
    /// Otherwise `false`.
    var isSuccessful: Bool {
        return 200 ... 299 ~= statusCode
    }
}
