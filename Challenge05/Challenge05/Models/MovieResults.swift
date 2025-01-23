//
//  MovieResults.swift
//  Challenge05
//
//  Created by Abdelahad on 21/01/2025.
//

import Foundation

struct MovieResult: Codable {
    let page: Int
    let movies: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case movies = "results"
        case page
        case totalPages
        case totalResults
    }
}
