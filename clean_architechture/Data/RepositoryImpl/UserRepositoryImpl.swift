//
//  UserRepositoryImpl.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation
import RxSwift

struct UserRepositoryImpl: UserRepository {
    func getUser() -> Observable<User> {
        return Observable.create { observer in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                observer.onNext(User(id: "1", email: "test@gmail.com"))
            }
            return Disposables.create()
        }
    }
}
