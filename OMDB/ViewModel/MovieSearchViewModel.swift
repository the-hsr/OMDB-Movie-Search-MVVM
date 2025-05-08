//
//  MovieSearchViewModel.swift
//  OMDB
//
//  Created by Himanshu Singh on 05/05/25.
//

import Foundation
import Combine

class MovieSearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let movieService: MovieServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }

    func searchMovies() {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter a movie name."
            return
        }

        isLoading = true
        errorMessage = nil

        movieService.searchMovies(query: query)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] response in
                self?.isLoading = false
                if response.response == "True", let results = response.search {
                    self?.movies = results
                } else {
                    self?.movies = []
                    self?.errorMessage = response.error ?? "No results found."
                }
            })
            .store(in: &cancellables)
    }
}
