//
//  ValidatorRepository.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import Foundation
import RxSwift

struct ValidatorRepositoryImpl: ValidatorRepository {
    func validateEmail(email: String) -> ValidationResult {
        return Validator.validateEmail(email).mapToVoid()
    }
    
    func validatePassword(password: String) -> ValidationResult {
        return Validator.validatePassword(password).mapToVoid()
    }
}

