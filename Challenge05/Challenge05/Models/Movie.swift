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
    let backdropPath: String
    let posterPath: String
    let originalTitle: String
    let overview: String
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case backdropPath
        case posterPath
        case originalTitle
        case overview
        case releaseDate
    }
    
    var backdropPathUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/original/\(backdropPath)")
    }
    
    var posterPathUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/original/\(posterPath)")
    }
}

extension Movie {
    static let fakeMovie = Movie(
        id: 939243,
        title: "Sonic the Hedgehog 3",
        backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        posterPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
        originalTitle: "Sonic the Hedgehog 3",
        overview: "Sonic, Knuckles, and Tails reunite against a powerful new adversary.",
        releaseDate: "2024-12-19"
    )
    
    static let fakeMovieList: [Movie] =  [
        Movie(
            id: 939243,
            title: "Sonic the Hedgehog 3",
            backdropPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
            posterPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
            originalTitle: "Sonic the Hedgehog 3",
            overview: "Sonic, Knuckles, and Tails reunite against a powerful new adversary.",
            releaseDate: "2024-12-19"),
        Movie(
            id: 539972,
            title: "Kraven the Hunter",
            backdropPath: "/v9Du2HC3hlknAvGlWhquRbeifwW.jpg",
            posterPath: "/b85bJfrTOSJ7M5Ox0yp4lxIxdG1.jpg",
            originalTitle: "Kraven the Hunter",
            overview: "Kraven Kravinoff's complex relationship with his ruthless gangster father.",
            releaseDate: "2024-12-11"),
        Movie(
            id: 762509,
            title: "Mufasa: The Lion King",
            backdropPath: "/oHPoF0Gzu8xwK4CtdXDaWdcuZxZ.jpg",
            posterPath: "/jbOSUAWMGzGL1L4EaUF8K6zYFo7.jpg",
            originalTitle: "Mufasa: The Lion King",
            overview: "Mufasa, a cub lost and alone",
            releaseDate: "2024-12-18")
    ]
}
