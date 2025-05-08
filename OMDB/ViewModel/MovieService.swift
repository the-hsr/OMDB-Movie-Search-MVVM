//
//  MovieService.swift
//  OMDB
//
//  Created by Himanshu Singh on 08/05/25.
//
import Foundation
import Combine

protocol MovieServiceProtocol {
    func searchMovies(query: String) -> AnyPublisher<MovieSearchResponse, Error>
}

class MovieService: MovieServiceProtocol {
    private let apiKey = "99b6efb0"
    private let networkManager: NetworkManaging

    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    func searchMovies(query: String) -> AnyPublisher<MovieSearchResponse, Error> {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty,
              let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://www.omdbapi.com/?apikey=\(apiKey)&s=\(encoded)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return networkManager.fetch(url: url)
    }
}
