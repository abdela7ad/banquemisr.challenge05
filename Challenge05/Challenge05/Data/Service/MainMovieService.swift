//
//  MainMovieService.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

final class MainMovieService: MovieService {
    private let hostProvider: HostProvider
    private let networkProvider: NetworkProvider

    init(hostProvider: HostProvider, networkProvider: NetworkProvider) {
        self.hostProvider = hostProvider
        self.networkProvider = networkProvider
    }
    func movies(path: String, page: Int) async throws -> MovieResult {
        let url = hostProvider
            .getHost()
            .appendingPathComponent(path)
            .appending(queryItems: [
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "\(page)")
            ])
  
        return try await networkProvider.sendAndRetrieve(method: .get, destination: url)
    }
    
    func movieDetail(movieId: Int) async throws -> MovieDetail {
        let url = hostProvider
            .getHost()
            .appendingPathComponent("\(movieId)")
            .appending(queryItems: [
                URLQueryItem(name: "language", value: "en-US"),
            ])
  
        return try await networkProvider.sendAndRetrieve(method: .get, destination: url)
    }
}
