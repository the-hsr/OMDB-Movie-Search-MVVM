//
//  ContentView.swift
//  OMDB
//
//  Created by Himanshu Singh on 05/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieSearchViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                searchBar

                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    movieList
                }
            }
            .navigationTitle(CommonStrings.title)
        }
    }

    var searchBar: some View {
        HStack {
            TextField(CommonStrings.searchMovie, text: $viewModel.query, onCommit: {
                viewModel.searchMovies()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                viewModel.searchMovies()
            }) {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .padding(8)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .shadow(radius: 1)
    }

    var movieList: some View {
        List(viewModel.movies) { movie in
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
        .listStyle(PlainListStyle())
    }
}
