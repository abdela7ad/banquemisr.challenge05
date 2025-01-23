//
//  MovieListCell.swift
//  Challenge05
//
//  Created by Abdelahad on 21/01/2025.
//

import SwiftUI

struct MovieListCell: View {
   
    private let movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        VStack {
            CachedAsyncImage(url: movie.posterPathUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: (UIScreen.main.bounds.width - 24) / 2, height: 250)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 250)
            HStack {
                VStack(alignment: .leading){
                    Text(movie.originalTitle).bold()
                    Text(movie.releaseDate)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

