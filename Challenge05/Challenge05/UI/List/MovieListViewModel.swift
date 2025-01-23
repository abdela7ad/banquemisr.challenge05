//
//  MovieListViewModel.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import SwiftUICore

final class MovieListViewModel: ObservableObject {
    enum ViewState {
        case fetching
        case data(movies: [Movie], cached: Date?)
        case error(message: String)
    }
    @Published var datasource: [Int:[Movie]] = [:]
    @Published var state: ViewState = .fetching
    private var currentPage: Int = 1
    private var totalPage: Int = 1
    @Published var source: ListMovieSource

    init(source: ListMovieSource,
         movieRepository: MovieRepository = AppDependancyContainer.shared.movieDependacyContainer.makeMovieReposity()) {
        self.source = source
        self.movieRepository = movieRepository
    }
    
    @MainActor
    func loadMovies(page: Int = 1) async {
        if datasource.isEmpty { state = .fetching }
        
        do {
            let fetchedMovies = try await movieRepository.movies(path: source.path, page: page)
            self.totalPage = fetchedMovies.totalPages
            self.currentPage = page
            self.datasource[page] = fetchedMovies.movies
           
            state = .data(movies: datasource.sorted(by: { $0.key < $1.key}).flatMap { $0.value }, cached: movieRepository.getLatestCachedDate())
        } catch  {
            if datasource.isEmpty {
                let message = (error as? NetworkError)?.readableMessage ?? "unexpected error. please contact the help center with code \(9001)"
                state = .error(message: message)
            }
        }
    }
    
    @MainActor
    func loadMore() async {
        guard currentPage < totalPage else { return }
        await loadMovies(page: currentPage + 1)
    }
    
    private let movieRepository: MovieRepository
}
