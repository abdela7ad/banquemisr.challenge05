//
//  MainMovieDatastore.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

final class MainMovieDatastore: MovieDataStore {
    
    private let dataStore: Datastore
    
    init(dataStore: Datastore) {
        self.dataStore = dataStore
    }
    
    func cachedMovies(suffixKey: String) -> MovieResult? {
        dataStore.get(key: "\(Constants.CachedMoviesKey) - \(suffixKey)")
    }
    
    func movieDetail(movieId: Int) -> MovieDetail? {
        dataStore.get(key: "\(movieId)")
    }
    
    func saveFetchedMovies(_ result: MovieResult, suffixKey: String) {
        dataStore.save(key: "\(Constants.CachedMoviesKey) - \(suffixKey)", value: result)
    }
    
    func saveMovieDetail(_ detail: MovieDetail, for movieId: Int) {
        dataStore.save(key: "\(movieId)", value: detail)
    }
    
    func saveLatestCachedDate(_ date: Date) {
        dataStore.save(key: Constants.LatestCachedDateKey, value: date)
    }
    
    func latestCachedDate() -> Date? {
        dataStore.get(key: Constants.LatestCachedDateKey)
    }
    
    private struct Constants {
        static let CachedMoviesKey = "com.challenge05.datastore.cachedmovies"
        static let LatestCachedDateKey = "com.challenge05.datastore.cachedmovies"
    }
}
