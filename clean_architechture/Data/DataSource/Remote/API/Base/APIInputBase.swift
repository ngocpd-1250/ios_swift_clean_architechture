//
//  APIInputBase.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/07.
//

import Alamofire
import Foundation

open class APIInputBase {
    public var headers: HTTPHeaders?
    public var urlString: String
    public var method: HTTPMethod
    public var encoding: ParameterEncoding
    public var parameters: Parameters?
    public var requireAccessToken: Bool
    public var accessToken: String?
    
    public var usingCache = false {
        didSet {
            if method != .get || self is APIUploadInputBase {
                fatalError()  // swiftlint:disable:this fatal_error_message
            }
        }
    }
    
    public var user: String?
    public var password: String?
    
    public init(urlString: String,
                parameters: [String: Any]?,
                method: HTTPMethod,
                requireAccessToken: Bool) {
        self.urlString = urlString
        self.parameters = parameters
        self.method = method
        self.encoding = method == .get ? URLEncoding.default : JSONEncoding.default
        self.requireAccessToken = requireAccessToken
    }
}

extension APIInputBase {
    public var urlEncodingString: String {
        guard
            let url = URL(string: urlString),
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let parameters = parameters,
            method == .get
            else {
                return urlString
        }
        
        urlComponents.queryItems = []
        
        for name in parameters.keys.sorted() {
            if let value = parameters[name] {
                let item = URLQueryItem(
                    name: "\(name)",
                    value: "\(value)"
                )
                
                urlComponents.queryItems?.append(item)
            }
        }
        
        return urlComponents.url?.absoluteString ?? urlString
    }
    
    public func description(isIncludedParameters: Bool) -> String {
        if method == .get || !isIncludedParameters {
            return "🌎 \(method.rawValue) \(urlEncodingString)"
        }
        
        return [
            "🌎 \(method.rawValue) \(urlString)",
            "Parameters: \(String(describing: parameters ?? JSONDictionary()))"
        ].joined(separator: "\n")
    }
}

public struct APIUploadData {
    public let data: Data
    public let name: String
    public let fileName: String
    public let mimeType: String
    
    public init(data: Data, name: String, fileName: String, mimeType: String) {
        self.data = data
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
}

open class APIUploadInputBase: APIInputBase {
    public let data: [APIUploadData]
    
    public init(data: [APIUploadData],
                urlString: String,
                parameters: [String: Any]?,
                method: HTTPMethod,
                requireAccessToken: Bool) {
        
        self.data = data
        
        super.init(
            urlString: urlString,
            parameters: parameters,
            method: method,
            requireAccessToken: requireAccessToken
        )
    }
}
