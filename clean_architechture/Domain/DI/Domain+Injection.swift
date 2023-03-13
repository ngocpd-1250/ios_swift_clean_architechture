//
//  Domain+Injection.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation

extension Resolver {
    static func registerDomain() {
        register { LoginUseCase() as LoginUseCaseType }
        register { ValidateEmailUseCase() as ValidateEmailUseCaseType }
        register { ValidatePasswordUseCase() as ValidatePasswordUseCaseType }
        register { GetTopRatedMoviesUseCase() as GetTopRatedMoviesUseCaseType }
    }
}
