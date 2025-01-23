//
//  MovieDependacyContainer.swift
//  Challenge05
//
//  Created by Abdelahad on 23/01/2025.
//

final class MovieDependacyContainer {
    private let movieService: MovieService
    private let movieDataStore: MovieDataStore

    init(hostProvider: HostProvider,
         networkProvider: NetworkProvider) {
        self.movieService = MainMovieService(hostProvider: hostProvider, networkProvider: networkProvider)
        self.movieDataStore = MainMovieDatastore(dataStore: MemoryDatastore())
    }
    
    func makeMovieReposity() -> MovieRepository {
        MainMovieRepository(service: movieService, datastore: movieDataStore)
    }
}
