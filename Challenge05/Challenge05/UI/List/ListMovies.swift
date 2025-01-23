//
//  ListMovies.swift
//  Challenge05
//
//  Created by Abdelahad on 21/01/2025.
//

import SwiftUI

struct ListMovies: View {
    @State var path: [Movie] = []
    @ObservedObject private var viewModel: MovieListViewModel
    let columns = [
        GridItem(.fixed((UIScreen.main.bounds.width - 24) / 2)),
         GridItem(.fixed((UIScreen.main.bounds.width - 24) / 2)),
     ]
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader { geometryProxy in
                ScrollView {
                     render(geometryProxy)
                        .padding(.horizontal, 8)
                        .frame(width: geometryProxy.size.width)
                        .navigationTitle(viewModel.source.navigationTitle)
                        .navigationBarTitleDisplayMode(.inline)
                        .listStyle(.inset)
                        .task {
                            await viewModel.loadMovies()
                        }
                }
                .refreshable {
                    Task {
                        await viewModel.loadMovies()
                    }
                }
            }
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(viewModel: MovieDetailsViewModel(movie: movie))
            }
        }
        
    }
    
    @ViewBuilder
    func render(_ geometryProxy: GeometryProxy) -> some View{
        switch viewModel.state {
        case .fetching:
            VStack(alignment: .center) {
                ProgressView().progressViewStyle(.circular)
                Text("Loading").font(.footnote)
            }
            .frame(height: geometryProxy.size.height)
        case .data(let movies, let cached):
            VStack {
                if let cached {
                    Text("Latest Update: \(cached.formatted(date: .long, time: .standard))")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 200)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    grid(movies)
                } else {
                    grid(movies)
                }
            }
        case .error(let message):
             Text(message)
                .font(.body)
                .bold()
                .multilineTextAlignment(.center)
                .frame(height: geometryProxy.size.height)
        }
    }
    
    @ViewBuilder private func grid(_ movies: [Movie]) -> some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(movies, id: \.self) { movie in
                MovieListCell(movie: movie)
                    .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .onTapGesture {
                        tapAction(movie)
                    }
                    .onAppear {
                        if movies.last?.id == movie.id {
                            Task {
                                await viewModel.loadMore()
                            }
                        }
                    }
            }
        }
    }
    
    private func tapAction(_ movie: Movie) {
        path.append(movie)
    }
}
