//
//  Movie.swift
//  MoviesApp
//
//  Created by Muhammad Choudhary on 2025-01-10.
//

import Foundation

struct Movie: Identifiable, Codable {
let id: String
let title: String
let genre: String
let releaseYear: Int
let posterImageName: String
let description: String
}
