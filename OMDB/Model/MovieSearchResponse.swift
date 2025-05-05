//
//  MovieSearchResponse.swift
//  OMDB
//
//  Created by Himanshu Singh on 05/05/25.
//

import Foundation

struct MovieSearchResponse: Decodable {
    let search: [Movie]?
    let response: String
    let error: String?

    private enum CodingKeys: String, CodingKey {
        case search = "Search"
        case response = "Response"
        case error = "Error"
    }
}
