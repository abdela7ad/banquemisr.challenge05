//
//  MovieDataStore.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

protocol MovieDataStore {
    
    func saveFetchedMovies(_ result: MovieResult, suffixKey: String)

    func cachedMovies(suffixKey: String) -> MovieResult?
    
    func movieDetail(movieId: Int) ->  MovieDetail?
    
    func saveMovieDetail(_ detail: MovieDetail, for movieId: Int)
    
    func saveLatestCachedDate(_ date: Date)
    
    func latestCachedDate() -> Date?
}


