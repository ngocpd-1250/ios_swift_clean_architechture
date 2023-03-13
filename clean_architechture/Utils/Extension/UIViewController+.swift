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
}
