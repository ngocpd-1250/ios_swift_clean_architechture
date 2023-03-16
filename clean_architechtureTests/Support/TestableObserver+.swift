//
//  TestableObserver+.swift
//  clean_architechtureTests
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import RxTest

extension TestableObserver {
    var lastEventElement: Element? {
        return events.last?.value.element
    }

    var firstEventElement: Element? {
        return events.first?.value.element
    }
}
