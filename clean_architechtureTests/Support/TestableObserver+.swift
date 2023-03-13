//
//  TestableObserver+.swift
//  clean_architechtureTests
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import RxTest

extension TestableObserver {
    var lastEventElement: Element? {
        return self.events.last?.value.element
    }
    
    var firstEventElement: Element? {
        return self.events.first?.value.element
    }
}
