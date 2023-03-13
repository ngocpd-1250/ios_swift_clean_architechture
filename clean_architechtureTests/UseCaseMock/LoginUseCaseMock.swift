//
//  LoginUseCaseMock.swift
//  clean_architechtureTests
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

@testable import clean_architechture
import RxSwift
import Foundation

final class LoginUseCaseMock: LoginUseCaseType {
    var login_Called = false
    var login_ReturnValue = Observable.just(())
    
    func login(email: String, password: String) -> Observable<Void> {
        login_Called = true
        return login_ReturnValue
    }
}
