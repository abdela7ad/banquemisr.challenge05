//
//  MovieDetail.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

struct MovieDetail: Codable {
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
}

struct Genre: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
}
