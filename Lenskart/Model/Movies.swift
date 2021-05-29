//
//  Movies.swift
//  Lenskart
//
//  Created by Vinay Raj on 29/05/21.
//

import Foundation

struct Movie: Decodable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    var imageURL: URL {
        let urlString: String = "http://image.tmdb.org/t/p/w92" + posterPath
        return URL(string: urlString)!
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Decodable {
    case en = "en"
    case pt = "pt"
}
