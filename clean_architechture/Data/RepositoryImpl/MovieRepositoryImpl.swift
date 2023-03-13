//
//  MovieRepositoryImpl.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import Foundation
import RxSwift

struct MovieRepositoryImpl: MovieRepository {
    
    func getTopRatedMovies() -> Observable<[Movie]> {
        let input = API.GetTopRatedMoviesInput()
        return API.shared.getTopRatedMovie(input).map { output in
            return output.movies.map { $0.toDomain() }
        }
    }
}
