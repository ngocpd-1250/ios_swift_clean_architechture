//
//  ValidateEmailUseCase.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import Foundation
import RxSwift

protocol ValidateEmailUseCaseType {
    func validateEmail(email: String) -> ValidationResult
}

struct ValidateEmailUseCase: ValidateEmailUseCaseType {
    @Injected var validatorRepository: ValidatorRepository
    
    func validateEmail(email: String) -> ValidationResult {
        return validatorRepository.validateEmail(email: email)
    }
}
