//
//  Data+Injection.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation

extension Resolver {
    static func registerData() {
        register { ValidatorRepositoryImpl() as ValidatorRepository }
        register { AuthRepositoryImpl() as AuthRepository }
        register { MovieRepositoryImpl() as MovieRepository }
    }
}
