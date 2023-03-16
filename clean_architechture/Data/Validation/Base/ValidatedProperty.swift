//
//  ValidatedProperty.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import ValidatedPropertyKit

protocol ValidatedProperty {
    var isValid: Bool { get }
    var validationError: ValidationError? { get }
}

extension Validated: ValidatedProperty {}
