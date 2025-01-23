//
//  MovieDetail.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

struct MovieDetail: Codable, Equatable {
    let backdropPath: String
    let genres: [Genre]
    let id: Int
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let tagline: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case backdropPath
        case genres
        case id
        case originalTitle
        case overview
        case posterPath
        case releaseDate
        case revenue
        case runtime
        case tagline
        case title
    }
    
    var backdropPathUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/original/\(backdropPath)")
    }
}

struct Genre: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
}

extension MovieDetail {
    static let fakeMovieDetail = MovieDetail(
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        genres: [Genre(id: 28, name: "Action")],
        id: 939243,
        originalTitle: "Sonic the Hedgehog 3",
        overview: "Sonic, Knuckles, and Tails reunite against a powerful new adversary.",
        posterPath: "/d8Ryb8AunYAuycVKDp5HpdWPKgC.jpg",
        releaseDate: "2024-12-19",
        revenue: 422398000,
        runtime: 110,
        tagline: "Try to keep up.",
        title: "Sonic the Hedgehog 3")
}
