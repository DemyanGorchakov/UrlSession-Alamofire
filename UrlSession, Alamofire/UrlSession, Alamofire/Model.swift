//
//  Model.swift
//  UrlSession, Alamofire
//
//  Created by Демьян on 16.04.2024.
//

import Foundation

struct FilmResponse: Codable {
    let keyword: String
    let pagesCount: Int
    let searchFilmsCountResult: Int
    let films: [Film]
}

// MARK: - Film
struct Film: Codable {
    let filmID: Int
    let nameRu, nameEn, type, year: String
    let description, filmLength: String
    let countries: [Country]
    let genres: [Genre]
    let rating: String
    let ratingVoteCount: Int
    let posterURL: String
    let posterURLPreview: String

    enum CodingKeys: String, CodingKey {
        case filmID = "filmId"
        case nameRu, nameEn, type, year, description, filmLength, countries, genres, rating, ratingVoteCount
        case posterURL = "posterUrl"
        case posterURLPreview = "posterUrlPreview"
    }
}

// MARK: - Country
struct Country: Codable {
    let country: String
}

// MARK: - Genre
struct Genre: Codable {
    let genre: String
}
