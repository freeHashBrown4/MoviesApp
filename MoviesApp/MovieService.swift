//
//  MovieService.swift
//  MoviesApp
//
//  Created by Muhammad Choudhary on 2025-01-14.
//

import Foundation

class MovieService {
    static let shared = MovieService()
    private let apiURL = "https://mocki.io/v1/36dba26b-9e70-4171-bc2d-4ba50252d43b"
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: apiURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success(movies))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
