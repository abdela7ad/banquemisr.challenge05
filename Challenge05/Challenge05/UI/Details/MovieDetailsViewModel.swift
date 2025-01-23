//
//  MovieDetailsViewModel.swift
//  Challenge05
//
//  Created by Abdelahad on 23/01/2025.
//

import SwiftUICore
import Foundation

final class MovieDetailsViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var overview: String = ""
    @Published var tagline: String = ""
    @Published var runtime: Int = 0
    @Published var revenu: Int = 0
    @Published var posterPath: URL?
    @Published var genres: [Genre] = []

    private let movie: Movie
    private let movieRepository: MovieRepository

    init(movie: Movie,
         movieRepository: MovieRepository = AppDependancyContainer.shared.movieDependacyContainer.makeMovieReposity()) {
        self.movie = movie
        self.movieRepository = movieRepository
    }
    
    @MainActor
    func loadMovieDetail() async {
        do {
            let details = try await movieRepository.movieDetail(movieId: movie.id)
            self.title = details.originalTitle
            self.overview = details.overview
            self.tagline = details.tagline
            self.genres = details.genres
            self.revenu = details.revenue
            self.runtime = details.runtime * 60 /// convert to Sec
            self.posterPath = URL(string: "https://image.tmdb.org/t/p/original/\(details.backdropPath)")
        } catch  {
            
        }
    }
}
