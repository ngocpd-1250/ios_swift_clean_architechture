//
//  APIResponse.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/07.
//

import Foundation

public struct APIResponse<T> {
    public var header: ResponseHeader?
    public var data: T

    public init(header: ResponseHeader?, data: T) {
        self.header = header
        self.data = data
    }
}
