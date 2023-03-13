//
//  ValidatorRepository.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import RxSwift

protocol ValidatorRepository {
    func validateEmail(email: String) -> ValidationResult
    func validatePassword(password: String) -> ValidationResult
}
