//
//  Property.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/09.
//

import UIKit
import RxSwift
import RxCocoa

@propertyWrapper
struct Property<Value> {
    
    private var subject: BehaviorRelay<Value>
    
    var wrappedValue: Value {
        get {
            return subject.value
        }
        set {
            subject.accept(newValue)
        }
    }
    
    var projectedValue: BehaviorRelay<Value> {
        return self.subject
    }
    
    init(wrappedValue: Value) {
        subject = BehaviorRelay(value: wrappedValue)
    }
}

