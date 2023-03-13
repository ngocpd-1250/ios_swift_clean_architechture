//
//  Bindable.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/08.
//

import UIKit

protocol Bindable: AnyObject {
    associatedtype ViewModel1
    
    var viewModel: ViewModel1! { get set }
    
    func bindViewModel()
}

extension Bindable where Self: UIViewController {
    func bindViewModel(to model: Self.ViewModel1) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
