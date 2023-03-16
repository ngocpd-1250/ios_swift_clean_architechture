//
//  AuthRepositoryImpl.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation
import RxSwift

struct AuthRepositoryImpl: AuthRepository {
    func logout() -> Observable<Void> {
        return Observable.just(())
    }

    func login(email _: String, password _: String) -> Observable<Void> {
        return Observable.create { observer in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                observer.onNext(())
            }
            return Disposables.create()
        }
    }
}
