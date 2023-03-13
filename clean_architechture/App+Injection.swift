//
//  App+Injection.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerDomain()
        registerData()
    }
}
