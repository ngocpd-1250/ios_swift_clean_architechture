//
//  APIErrorBase.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/07.
//

import UIKit

protocol APIError: LocalizedError {
    var statusCode: Int? { get }
}

extension APIError {
    var statusCode: Int? { return nil }
}

struct APIInvalidResponseError: APIError {
    init() {}

    var errorDescription: String? {
        return NSLocalizedString("api.invalidResponseError",
                                 value: "Invalid server response",
                                 comment: "")
    }
}

struct APIUnknownError: APIError {
    let statusCode: Int?

    init(statusCode: Int?) {
        self.statusCode = statusCode
    }

    var errorDescription: String? {
        return NSLocalizedString("api.unknownError",
                                 value: "Unknown API error",
                                 comment: "")
    }
}
