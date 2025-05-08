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
                SearchBarView(viewModel: viewModel)
                
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
                    MovieListView(movies: viewModel.movies)
                }
            }
            .navigationTitle(CommonStrings.title)
        }
    }
}
