//
//  MovieDetailView.swift
//  Challenge05
//
//  Created by Abdelahad on 21/01/2025.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailsViewModel
    init(viewModel: MovieDetailsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        ScrollView {
            if viewModel.loading {
                ProgressView()
            } else if let message = viewModel.errorMessage {
                Text(message)
                    .multilineTextAlignment(.center)
                    .padding(.top, 32)
                    .padding(.horizontal, 32)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            } else {
                VStack(spacing: 16){
                    headerImage
                    VStack(alignment: .leading) {
                        subheader
                        genres.padding(.bottom, 16)
                        Text(viewModel.overview).font(.subheadline)
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .task {
            await viewModel.loadMovieDetail()
        }
        .refreshable {
            Task { await viewModel.loadMovieDetail() }
        }
        .navigationTitle(viewModel.title)
  
    }
    
    @ViewBuilder private var subheader: some View {
        let time = Duration
            .UnitsFormatStyle(
                allowedUnits:[.hours, .minutes, .seconds],
                width: .abbreviated)
            .format(.seconds(viewModel.runtime))
        Text(viewModel.title).font(.largeTitle).bold()
        Text(viewModel.tagline).font(.subheadline).foregroundStyle(.secondary)
        
        HStack {
            Text("\(time) -")
            Text("$\(viewModel.revenu.formatted(.number.notation(.compactName)))")
        }
    }
    
    @ViewBuilder private var genres: some View {
        FlowLayout(alignment: .leading) {
            ForEach(viewModel.genres, id:\.self) { genre in
                Text(genre.name)
                    .font(.caption)
                    .bold()
                    .padding(6)
                    .background(Color.secondary.opacity(0.2), in: RoundedRectangle(cornerRadius: 8))
          }
        }
    }
    @ViewBuilder private var headerImage: some View {
        GeometryReader { geo in
            CachedAsyncImage(url: viewModel.posterPath) { image in
                image
                    .resizable()
                    .frame(width: geo.size.width, height: 300)
                    .scaledToFill()
            } placeholder: {
                ProgressView()
                    .frame(height: 300)
                    .frame(width: geo.size.width)
            }
        }
        .frame(height: 300)
    }
}
