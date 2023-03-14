//
//  SecureStorage.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/14.
//

import Foundation
import KeychainSwift

@propertyWrapper
struct SecureStorage<T: Codable> {
    
    struct Wrapper<T>: Codable where T: Codable {
        let wrapped: T
    }
    
    private let key: String
    private let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            guard let data = KeychainSwift().getData(key) else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(Wrapper<T>.self, from: data)
            return value?.wrapped ?? defaultValue
        }
        set {
            do {
                let data = try JSONEncoder().encode(Wrapper(wrapped: newValue))
                KeychainSwift().set(data, forKey: key)
            } catch {
                print("SecureStorage error: \(error)")
            }
        }
    }
}

