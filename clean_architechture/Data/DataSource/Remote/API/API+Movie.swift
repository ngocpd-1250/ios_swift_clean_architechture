//
//  API+Movie.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift

extension API {
    func getTopRatedMovie(_ input: GetTopRatedMoviesInput) -> Observable<GetTopRatedMoviesOutput> {
        return request(input)
    }
}

extension API {
    final class GetTopRatedMoviesInput: APIInput {
        init() {
            super.init(urlString: API.Urls.Movie.topRated,
                       parameters: nil,
                       method: .get,
                       requireAccessToken: false)
        }
    }

    final class GetTopRatedMoviesOutput: APIOutput {
        private(set) var movies: [MovieData] = []

        override func mapping(map: Map) {
            super.mapping(map: map)
            movies <- map["results"]
        }
    }
}
