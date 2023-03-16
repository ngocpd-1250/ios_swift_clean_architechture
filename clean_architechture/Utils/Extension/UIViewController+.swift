//
//  File.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/13.
//

import UIKit

extension UIViewController {
    public func logDeinit() {
        print(String(describing: type(of: self)) + " deinit")
    }

    func showErrorMessage(actionTitle: String = "OK",
                          message: String,
                          completion: (() -> Void)? = nil) {
        let message = message.replacingOccurrences(of: "<br>", with: "\n")
        let ac = UIAlertController(title: "",
                                   message: message,
                                   preferredStyle: .alert)

        let okAction = UIAlertAction(title: actionTitle, style: .cancel) { _ in
            completion?()
        }
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
    }

    func showAlert(message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "",
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: nil))

        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: completion))

        present(alert, animated: true)
    }
}
