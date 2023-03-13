//
//  UserRepository.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation
import RxSwift

protocol UserRepository {
    func getUser() -> Observable<User>
}
