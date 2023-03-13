//
//  MovieListNavigator.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import UIKit

protocol MovieListNavigatorType {
    func toMovieList()
}

struct MovieListNavigator: MovieListNavigatorType {
    unowned let window: UIWindow
    
    func toMovieList() {
        let vc = MovieListViewController.instantiate()
        let vm = MovieListViewModel(navigator: self)
        vc.bindViewModel(to: vm)
        window.rootViewController = vc
    }
}
