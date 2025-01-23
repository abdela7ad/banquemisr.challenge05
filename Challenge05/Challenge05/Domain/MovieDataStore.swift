//
//  MovieDataStore.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

protocol MovieDataStore {
    
    func saveFetchedMovies(_ result: MovieResult, page: Int)

    func cachedMovies(page: Int) -> MovieResult?
    
    func movieDetail(movieId: Int) ->  MovieDetail?
    
    func saveMovieDetail(_ detail: MovieDetail, for movieId: Int)
    
    func saveLatestCachedDate(_ date: Date)
    
    func latestCachedDate() -> Date?
}


