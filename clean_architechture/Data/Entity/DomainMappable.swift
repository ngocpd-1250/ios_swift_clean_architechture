//
//  DomainMappable.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation

protocol DomainMappable {
    associatedtype T
    func toDomain() -> T
}
