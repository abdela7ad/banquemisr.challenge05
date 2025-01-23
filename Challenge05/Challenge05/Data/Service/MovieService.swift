//
//  MovieService.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

protocol MovieService {
    func movies(path: String, page: Int) async throws -> MovieResult
    
    func movieDetail(movieId: Int) async throws -> MovieDetail
}
