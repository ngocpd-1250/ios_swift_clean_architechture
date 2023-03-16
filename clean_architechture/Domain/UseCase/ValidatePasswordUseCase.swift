//
//  ValidatePasswordUseCase.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import Foundation
import RxSwift

protocol ValidatePasswordUseCaseType {
    func validatePassword(password: String) -> ValidationResult
}

struct ValidatePasswordUseCase: ValidatePasswordUseCaseType {
    @Injected var validatorRepository: ValidatorRepository

    func validatePassword(password: String) -> ValidationResult {
        return validatorRepository.validatePassword(password: password)
    }
}
