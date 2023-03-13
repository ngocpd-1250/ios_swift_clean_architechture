//
//  GetUserUseCase.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation
import RxSwift

protocol GetUserUseCaseType {
    func getUser() -> Observable<User>
}

struct GetUserUseCase: GetUserUseCaseType {
    let repository: UserRepository
    
    func getUser() -> Observable<User> {
        return repository.getUser()
    }
}
