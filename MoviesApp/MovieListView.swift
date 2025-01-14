//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Muhammad Choudhary on 2025-01-10.
//

import SwiftUI

import SwiftUI
struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    var body: some View {
        NavigationView {
            Group {
                if viewModel.movies.isEmpty {
                    ProgressView("Loading Movies...")
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieRowView(movie: movie)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchMovies()
            }
            .navigationTitle("Movies")
        }
    }
}
struct MovieRowView: View {
    let movie: Movie
    var body: some View {
        HStack {
            Image(movie.posterImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 120)
                .cornerRadius(8)
                .shadow(radius: 4)
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                Text("\(movie.genre) - \(movie.releaseYear)")
                    .font(.subheadline)
                
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}
