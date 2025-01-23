//
//  MainMovieRepository.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

final class MainMovieRepository: MovieRepository {
    
    private let service: MovieService
    private let datastore: MovieDataStore
    
    init(service: MovieService, datastore: MovieDataStore) {
        self.service = service
        self.datastore = datastore
    }
    
    func movies(path: String, page: Int) async throws -> MovieResult {
        do {
            let freshResults = try await service.movies(path: path, page: page)
            datastore.saveFetchedMovies(freshResults, page: page)
            if page == 1 {
                datastore.saveLatestCachedDate(.now)
            }
            return freshResults
        } catch  {
            if let storedResults = datastore.cachedMovies(page: page) {
                return storedResults
            } else {
                throw error
            }
        }
    }
    
    func movieDetail(movieId: Int) async throws -> MovieDetail {
        if let storedDetails = datastore.movieDetail(movieId: movieId)  {
            return storedDetails
        } else {
            let freshDetails = try await service.movieDetail(movieId: movieId)
            datastore.saveMovieDetail(freshDetails, for: movieId)
            return freshDetails
        }
    }
    
    func getLatestCachedDate() -> Date? {
        datastore.latestCachedDate()
    }
}
