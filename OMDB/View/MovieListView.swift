//
//  MovieListView.swift
//  OMDB
//
//  Created by Himanshu Singh on 08/05/25.
//

import SwiftUI

struct MovieListView: View {
    let movies: [Movie]

    var body: some View {
        List(movies) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                HStack {
                    AsyncImage(url: URL(string: movie.poster)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } else {
                            ZStack {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                Image(systemName: "film")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.gray)
                                    .padding(10)
                            }
                        }
                    }
                    .frame(width: 50, height: 75)
                    .cornerRadius(6)
                    .clipped()

                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        Text(movie.year)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}
