//
//  SearchBarView.swift
//  OMDB
//
//  Created by Himanshu Singh on 08/05/25.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var viewModel: MovieSearchViewModel

    var body: some View {
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
}
