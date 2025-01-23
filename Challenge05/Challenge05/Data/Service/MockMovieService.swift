//
//  MockMovieService.swift
//  Challenge05
//
//  Created by Abdelahad on 24/01/2025.
//

final class MockMovieService: MovieService {
    private let error: NetworkError?
    init(error: NetworkError? = nil) {
        self.error = error
    }
    
    func movies(path: String, page: Int) async throws -> MovieResult {
        if let error {
            throw error
        } else {
            MovieResult(page: 1, movies: Movie.fakeMovieList, totalPages: 172, totalResults: 10)
        }
    }
    
    func movieDetail(movieId: Int) async throws -> MovieDetail {
        if let error {
            throw error
        } else {
            MovieDetail.fakeMovieDetail
        }
    }
}
