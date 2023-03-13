//
//  BaseNavigationController.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import Foundation
import UIKit
import Then

final class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
//        viewController.removeBackButtonTitle()
    }
    
    private func configNavigationBar() {
        delegate = self
    }
}

extension BaseNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        if viewControllers.count > 1 {
            interactivePopGestureRecognizer?.isEnabled = true
        } else {
            interactivePopGestureRecognizer?.isEnabled = false
        }
    }
}

