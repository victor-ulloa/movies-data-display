//
//  Movie.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-12.
//

import Foundation
import SwiftData

@Model
final class Movie: Codable {
    
    var actors: String
    var criticsRating: Double
    var directors: String
    var genres: String
    var length: Int
    var movieID: Int
    var mpaRating: String
    var shortDescription: String
    var studio: String
    var title: String
    var writers: String
    var year: String
    
    init(actors: String, criticsRating: Double, directors: String, genres: String, length: Int, movieID: Int, mpaRating: String, shortDescription: String, studio: String, title: String, writers: String, year: String) {
        self.actors = actors
        self.criticsRating = criticsRating
        self.directors = directors
        self.genres = genres
        self.length = length
        self.movieID = movieID
        self.mpaRating = mpaRating
        self.shortDescription = shortDescription
        self.studio = studio
        self.title = title
        self.writers = writers
        self.year = year
    }
    
    enum CodingKeys: CodingKey {
        case actors
        case criticsRating
        case directors
        case genres
        case length
        case movieID
        case mpaRating
        case shortDescription
        case studio
        case title
        case writers
        case year
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        actors = try container.decode(String.self, forKey: .actors)
        criticsRating = try container.decode(Double.self, forKey: .criticsRating)
        directors = try container.decode(String.self, forKey: .directors)
        genres = try container.decode(String.self, forKey: .genres)
        length = try container.decode(Int.self, forKey: .length)
        movieID = try container.decode(Int.self, forKey: .movieID)
        mpaRating = try container.decode(String.self, forKey: .mpaRating)
        shortDescription = try container.decode(String.self, forKey: .shortDescription)
        studio = try container.decode(String.self, forKey: .studio)
        title = try container.decode(String.self, forKey: .title)
        writers = try container.decode(String.self, forKey: .writers)
        year = try container.decode(String.self, forKey: .year)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(actors, forKey: .actors)
        try container.encode(criticsRating, forKey: .criticsRating)
        try container.encode(directors, forKey: .directors)
        try container.encode(genres, forKey: .genres)
        try container.encode(length, forKey: .length)
        try container.encode(movieID, forKey: .movieID)
        try container.encode(mpaRating, forKey: .mpaRating)
        try container.encode(shortDescription, forKey: .shortDescription)
        try container.encode(studio, forKey: .studio)
        try container.encode(title, forKey: .title)
        try container.encode(writers, forKey: .writers)
        try container.encode(year, forKey: .year)
    }
    
    // Additional functionality or annotations for the ORM can be added here if needed
    
}
