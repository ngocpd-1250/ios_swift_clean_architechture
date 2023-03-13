//
//  Validator.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import ValidatedPropertyKit

struct Validator {
    @Validated(.matchEmail(message: "Invalid Email"))
    
    var email: String?
    
    @Validated(.matchPassword(message: "Invalid Password"))
    
    var password: String?
    
    var validatedProperties: [ValidatedProperty] {
        return [
            _email,
            _password
        ]
    }
}

extension Validator {
    static func validateEmail(_ email: String) -> Result<String, ValidationError> {
        return Validator()._email.isValid(value: email)
    }
    
    static func validatePassword(_ password: String) -> Result<String, ValidationError> {
        return Validator()._password.isValid(value: password)
    }
}
