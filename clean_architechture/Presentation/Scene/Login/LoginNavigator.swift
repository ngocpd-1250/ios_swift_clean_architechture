//
//  LoginNavigator.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import UIKit
import Reusable

protocol LoginNavigatorType {
    func toLogin()
    func toMovieList()
}

struct LoginNavigator: LoginNavigatorType {
    unowned let window: UIWindow
    private let navigation = BaseNavigationController()

    func toLogin() {
        let vc = LoginViewController.instantiate()
        let vm = LoginViewModel(navigator: self)
        vc.bindViewModel(to: vm)
        navigation.viewControllers = [vc]
        window.rootViewController = navigation
    }

    func toMovieList() {
        let navigator = MovieListNavigator(window: window)
        navigator.toMovieList()
    }
}
