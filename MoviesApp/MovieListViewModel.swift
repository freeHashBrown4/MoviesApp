//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Muhammad Choudhary on 2025-01-10.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    func fetchMovies() {
        MovieService.shared.fetchMovies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedMovies):
                    self?.movies = fetchedMovies
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                    
                    
                }
            }
        }
    }
}

