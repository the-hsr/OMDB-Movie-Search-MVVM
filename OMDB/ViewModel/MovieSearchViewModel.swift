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

    private var cancellables = Set<AnyCancellable>()
    private let apiKey = "99b6efb0"

    func searchMovies() {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = CommonStrings.enterMovieName
            return
        }

        isLoading = true
        errorMessage = nil

        let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://www.omdbapi.com/?apikey=\(apiKey)&s=\(queryEncoded)"

        guard let url = URL(string: urlString) else {
            errorMessage = CommonStrings.invalideURL
            isLoading = false
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieSearchResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
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
                    self?.errorMessage = response.error ?? CommonStrings.noResultsFound
                }
            })
            .store(in: &cancellables)
    }
}
