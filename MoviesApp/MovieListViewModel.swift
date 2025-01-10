//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Muhammad Choudhary on 2025-01-10.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    init() {
        fetchMovies()
    }

    private func fetchMovies() {
        movies = JSONLoader.loadMovies(from: "movies")
    }
}
