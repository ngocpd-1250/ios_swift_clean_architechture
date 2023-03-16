//
//  ObservableType+.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import RxSwift
import RxCocoa

extension ObservableType {
    func catchErrorJustComplete() -> Observable<Element> {
        return `catch` { _ in
            return Observable.empty()
        }
    }

    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            return Driver.empty()
        }
    }

    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }

    func mapToOptional() -> Observable<Element?> {
        return map { value -> Element? in value }
    }

    func unwrap<T>() -> Observable<T> where Element == T? {
        return flatMap { Observable.from(optional: $0) }
    }
}

extension ObservableType where Element == Bool {
    func not() -> Observable<Bool> {
        return map(!)
    }

    static func or(_ sources: Observable<Bool>...)
        -> Observable<Bool> {
        return Observable.combineLatest(sources)
            .map { $0.contains(true) }
    }

    static func and(_ sources: Observable<Bool>...)
        -> Observable<Bool> {
        return Observable.combineLatest(sources)
            .map { $0.allSatisfy { $0 } }
    }
}
