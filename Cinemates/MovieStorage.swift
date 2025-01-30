//
//  MovieStorage.swift
//  Cinemates
//
//  Created by Sanyukta Lamsal on 12/3/23.
//

import Foundation

class MovieStorage: ObservableObject {
    @Published var newMovieTitle: String = ""
    
    @Published var movies: [Movie] = [] {
        didSet { saveMovies(movies: movies) }
    }
    
    private let moviesKey = "movies"
    
    init() {
        movies = readMovies()
    }
    
    private func saveMovies(movies: [Movie]) {
        do {
            let data = try JSONEncoder().encode(movies)
            UserDefaults.standard.set(data, forKey: moviesKey)
        } catch {
            print("Error saving movies: \(error)")
        }
    }
    
    func addMovie(_ movie: Movie) {
        movies.append(movie)
        saveMovies(movies: movies)
    }
    
 
    
    private func readMovies() -> [Movie] {
        guard let data = UserDefaults.standard.data(forKey: moviesKey) else { return [] }
        
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
        } catch {
            print("Error reading movies: \(error)")
            return []
        }
    }
}
