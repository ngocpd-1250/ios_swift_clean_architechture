//
//  MovieData.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import Foundation
import ObjectMapper

struct MovieData {
    var id: Int
    var adult = false
    var title = ""
    var overview = ""
    var popularity = 0.0
    var posterPath: String?
    var backdropPath: String?
    var voteCount = 0
    var voteAverage = 0.0
    var video = false
    var releaseDate = ""
}

extension MovieData: Mappable {
    init?(map _: Map) {
        self.init(id: 0)
    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        adult <- map["adult"]
        title <- map["title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        backdropPath <- map["backdrop_path"]
        voteCount <- map["vote_count"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        releaseDate <- map["release_date"]
    }
}

extension MovieData: DomainMappable {
    typealias T = Movie

    func toDomain() -> Movie {
        return Movie(id: id,
                     adult: adult,
                     video: video,
                     title: title,
                     overview: overview,
                     popularity: popularity,
                     posterUrl: AppConfig.MovieDB.imageUrl / (posterPath ?? ""),
                     voteAverage: voteAverage)
    }
}
