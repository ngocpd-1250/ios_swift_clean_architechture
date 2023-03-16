//
//  LogOptions.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/07.
//

import Foundation

public struct LogOptions: OptionSet {
    public let rawValue: Int

    public static let request = LogOptions(rawValue: 1 << 0)
    public static let requestParameters = LogOptions(rawValue: 1 << 1)
    public static let rawRequest = LogOptions(rawValue: 1 << 2)
    public static let urlResponse = LogOptions(rawValue: 1 << 3)
    public static let responseStatus = LogOptions(rawValue: 1 << 4)
    public static let responseData = LogOptions(rawValue: 1 << 5)
    public static let error = LogOptions(rawValue: 1 << 6)
    public static let cache = LogOptions(rawValue: 1 << 7)

    public static let `default`: [LogOptions] = [
        .request,
        .requestParameters,
        .responseStatus,
        .error
    ]

    public static let none: [LogOptions] = []

    public static let all: [LogOptions] = [
        .request,
        .requestParameters,
        .rawRequest,
        .urlResponse,
        .responseStatus,
        .responseData,
        .error,
        .cache
    ]

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
