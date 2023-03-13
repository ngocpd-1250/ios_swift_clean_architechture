//
//  MovieRepository.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import Foundation
import RxSwift

protocol MovieRepository {
    func getTopRatedMovies() -> Observable<[Movie]>
}
