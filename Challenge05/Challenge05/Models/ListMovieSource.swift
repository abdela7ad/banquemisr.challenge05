//
//  ListMovieSource.swift
//  Challenge05
//
//  Created by Abdelahad on 23/01/2025.
//

enum ListMovieSource {
    case nowPlaying
    case popular
    case upcomingPlaying

    var path: String {
        switch self {
        case .nowPlaying:
            "now_playing"
        case .popular:
            "popular"
        case .upcomingPlaying:
            "upcoming"
        }
    }
    
    var navigationTitle: String {
        switch self {
        case .nowPlaying:
            "Now Playing"
        case .popular:
            "Popular"
        case .upcomingPlaying:
            "Upcoming"
        }
    }
}
