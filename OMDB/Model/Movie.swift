//
//  Movie.swift
//  OMDB
//
//  Created by Himanshu Singh on 05/05/25.
//

import Foundation

struct Movie: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
