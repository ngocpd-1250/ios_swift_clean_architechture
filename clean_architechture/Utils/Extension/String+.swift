//
//  String+.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import Foundation

extension String {
    static func / (lhs: String, rhs: String) -> String {
        return lhs + "/" + rhs
    }
}
