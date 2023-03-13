//
//  Disposable.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import RxSwift

extension Array where Element == Disposable {
    func disposed(by disposeBag: DisposeBag) {
        forEach {
            $0.disposed(by: disposeBag)
        }
    }
}
