//
//  MovieDetailView.swift
//  OMDB
//
//  Created by Himanshu Singh on 07/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: movie.poster)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .overlay(
                            Image(systemName: "film")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.gray)
                                .padding()
                        )
                }
            }
            .frame(maxWidth: 200, maxHeight: 300)
            .cornerRadius(10)

            Text(movie.title)
                .font(.title)
                .multilineTextAlignment(.center)

            Text("Year: \(movie.year)")
                .font(.subheadline)

            Text("Type: \(movie.type.capitalized)")
                .font(.subheadline)

            Text("IMDb ID: \(movie.imdbID)")
                .font(.caption)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle("Movie Details")
    }
}
