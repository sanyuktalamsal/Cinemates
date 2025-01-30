//
//  MovieServiceViewModel.swift
//  Cinemates
//
//  Created by Sanyukta Lamsal on 11/27/23.
//


import Foundation

enum SearchLoadingState{
    case idle
    case loading
    case success(results: [Movie])
    case error (error: Error)
}

@MainActor
class MovieServiceViewModel: ObservableObject {
    // Inputs
    private let service = MovieService()
    @Published var state: SearchLoadingState = .idle
    @Published var title = ""
    @Published var userReviews: [UserReview] = []
    
    @MainActor
    func searchMovies(title: String) async {
        do {
            self.state = .loading
            let movies = try await MovieService.findMovies(title: title)
            let convertedMovies = movies.map { movie in
                let newMovie = movie
                return newMovie
            }
                self.state = .success(results: convertedMovies)
        } catch {
                self.state = .error(error: error)

        }
    }
    @MainActor
    func addReview(movie: Movie, review: String) {
        let userReview = UserReview(title: movie.title ?? "", posterURL: movie.posterURL, review: review)
        userReviews.append(userReview)
    }
}


