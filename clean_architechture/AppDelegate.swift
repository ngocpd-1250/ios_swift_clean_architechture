//
//  AppDelegate.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/07.
//

import UIKit
import Reusable

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication,
                     didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpRoot()
        return true
    }

    private func setUpRoot() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()

        if NSClassFromString("XCTest") != nil { // UnitTest
            window.rootViewController = UnitTestViewController()
        } else {
            let navigator = LoginNavigator(window: window)
            navigator.toLogin()
        }

        self.window = window
    }
}
