//
//  ValidationResult.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import Foundation
import ValidatedPropertyKit

typealias ValidationResult = Result<Void, ValidationError>

extension ValidationResult {
    var firstMessage: String {
        return message.components(separatedBy: "\n").first ?? ""
    }
}
