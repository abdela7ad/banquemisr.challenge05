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
            VStack(spacing: 16){
                GeometryReader { geo in
                    VStack {
                        AsyncImage(url: viewModel.posterPath) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: geo.size.width, height: 300)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                                .frame(height: 300)
                                .frame(width: geo.size.width)
                        }
                        Spacer()
                    }
                }
                .frame(height: 300)
                let time = Duration
                    .UnitsFormatStyle(allowedUnits: [.hours, .minutes, .seconds], width: .abbreviated)
                    .format(.seconds(viewModel.runtime))


                
                VStack(alignment: .leading) {
                    Text(viewModel.title).font(.largeTitle).bold()
                    Text(viewModel.tagline).font(.subheadline).foregroundStyle(.secondary)
                    HStack {
                        Text("\(time) -")
                        Text("$\(viewModel.revenu.formatted(.number.notation(.compactName)))")
                    }
                    FlowLayout(alignment: .leading) {
                        ForEach(viewModel.genres, id:\.self) { genre in
                            Text(genre.name)
                                .font(.caption)
                                .bold()
                                .padding(6)
                                .background(Color.secondary.opacity(0.2), in: RoundedRectangle(cornerRadius: 8))
                      }
                    }
                    .padding(.bottom, 16)
                    Text(viewModel.overview).font(.subheadline)
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle(viewModel.title)
        .task {
            await viewModel.loadMovieDetail()
        }
    }
}
