//
//  LoginNavigatorMock.swift
//  clean_architechtureTests
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

@testable import clean_architechture

final class LoginNavigatorMock: LoginNavigatorType {
    var toLogin_Called = false

    func toLogin() {
        toLogin_Called = true
    }

    var toHome_Called = false

    func toMovieList() {
        toHome_Called = true
    }
}
