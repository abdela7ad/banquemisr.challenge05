//
//  MainTabView.swift
//  Challenge05
//
//  Created by Abdelahad on 21/01/2025.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {
            ListMovies(viewModel: MovieListViewModel(source: .nowPlaying))
            .tabItem(.nowPlaying)
            
            ListMovies(viewModel: MovieListViewModel(source: .popular))
                .tabItem(.popular)
            
            ListMovies(viewModel: MovieListViewModel(source: .upcomingPlaying))
                .tabItem(.upcomingPlaying)
        }
    }
}

#Preview {
    MainTabView()
}
