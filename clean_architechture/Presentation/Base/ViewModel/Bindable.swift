//
//  Bindable.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import UIKit

protocol Bindable: AnyObject {
    associatedtype ViewModel

    var viewModel: ViewModel! { get set }

    func bindViewModel()
}

extension Bindable where Self: UIViewController {
    func bindViewModel(to model: Self.ViewModel) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
