//
//  NetworkManager.swift
//  OMDB
//
//  Created by Himanshu Singh on 08/05/25.
//

import Foundation
import Combine

protocol NetworkManaging {
    func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, Error>
}

final class NetworkManager: NetworkManaging {
    static let shared = NetworkManager()

    private init() {}

    func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
