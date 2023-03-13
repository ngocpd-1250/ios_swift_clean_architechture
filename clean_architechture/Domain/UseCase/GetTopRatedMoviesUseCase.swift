//
//  GetTopRatedMoviesUseCase.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import Foundation
import RxSwift

protocol GetTopRatedMoviesUseCaseType {
    func getTopRatedMovies() -> Observable<[Movie]>
}

struct GetTopRatedMoviesUseCase: GetTopRatedMoviesUseCaseType {
    @Injected var repository: MovieRepository
    
    func getTopRatedMovies() -> Observable<[Movie]> {
        return repository.getTopRatedMovies()
    }
}
