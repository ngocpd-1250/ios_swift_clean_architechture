//
//  Validation+.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import Foundation
import ValidatedPropertyKit

extension Validation where Value == String {
    static func matchEmail(message: String) -> Validation {
        return .init { value in
            let regexEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let validationStatus = NSPredicate(format: "SELF MATCHES %@", regexEmail)
            if validationStatus.evaluate(with: value) {
                return .success(())
            }
            return .failure(ValidationError(message: message))
        }
    }
    
    static func matchPassword(message: String) -> Validation {
        return .init { value in
            let regexPassword = "^(?=.*[!.?+$%#&*=@])(?=.*[A-Za-z0-9])[!.?+$%#&*=@A-Za-z0-9]{8,16}$"
            let validationStatus = NSPredicate(format: "SELF MATCHES %@", regexPassword)
            if validationStatus.evaluate(with: value) {
                return .success(())
            }
            return .failure(ValidationError(message: message))
        }
    }
}

extension Result where Failure == ValidationError {
    
    var message: String {
        switch self {
        case .success:
            return ""
        case .failure(let error):
            return error.description
        }
    }
    
    var isValid: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    func mapToVoid() -> ValidationResult {
        return self.map { _ in () }
    }
}
