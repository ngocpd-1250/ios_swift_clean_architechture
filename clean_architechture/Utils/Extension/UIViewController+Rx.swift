//
//  UIViewController+Rx.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import MBProgressHUD
import RxCocoa
import RxSwift
import UIKit

private enum Constant {
    static let defaultLoadingYOffset: CGFloat = -30
}

extension UIViewController {
    @objc var loadingYOffset: CGFloat {
        return Constant.defaultLoadingYOffset
    }
}

extension Reactive where Base: UIViewController {
    var error: Binder<Error> {
        return Binder(base) { viewController, error in
            guard !(viewController is UIAlertController) else {
                return
            }
            viewController.showErrorMessage(message: error.localizedDescription)
        }
    }

    var isLoading: Binder<Bool> {
        return Binder(base) { viewController, isLoading in
            if isLoading {
                let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
                hud.offset.y = viewController.loadingYOffset
            } else {
                MBProgressHUD.hide(for: viewController.view, animated: true)
            }
        }
    }
}
