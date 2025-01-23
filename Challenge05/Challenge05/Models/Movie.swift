//
//  Movie.swift
//  Challenge05
//
//  Created by Abdelahad on 21/01/2025.
//

import Foundation

struct Movie: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let adult: Bool
    let backdropPath: String
    let posterPath: String
    let originalTitle: String
    let overview: String
    let originalLanguage: String
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case adult
        case backdropPath
        case posterPath
        case originalTitle
        case overview
        case originalLanguage
        case popularity
        case releaseDate
        case video
        case voteAverage
        case voteCount
    }
}
