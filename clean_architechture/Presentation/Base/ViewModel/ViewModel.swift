//
//  ViewModel.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import RxSwift

protocol ViewModel {
    associatedtype Input
    associatedtype Output

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output
}
