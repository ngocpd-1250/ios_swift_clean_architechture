//
//  LoginUseCase.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation
import RxSwift

protocol LoginUseCaseType {
    func login(email: String, password: String) -> Observable<Void>
}

struct LoginUseCase: LoginUseCaseType {
    @Injected var repository: AuthRepository

    func login(email: String, password _: String) -> Observable<Void> {
        return repository.login(email: email, password: email)
    }
}
