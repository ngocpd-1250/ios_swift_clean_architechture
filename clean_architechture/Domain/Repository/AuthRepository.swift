//
//  AuthRepository.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import Foundation
import RxSwift

protocol AuthRepository {
    func login(email: String, password: String) -> Observable<Void>
    func logout() -> Observable<Void>
}
