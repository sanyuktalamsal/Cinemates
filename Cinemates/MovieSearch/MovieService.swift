//
//  MovieService.swift
//  Cinemates
//
//  Created by Sanyukta Lamsal on 11/27/23.
//

import Foundation

struct MovieService {
    private static let apiKey = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMDVjYWQ2NDE1MjAzZWYyMmIxOTFiNzU1NWQ2NmZmZiIsInN1YiI6IjY1NjRiM2U2MjQ0MTgyMDBjYTc4MzQ2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IWjcGVyOyktym_En1u1dwZlqhbEzUb0ktTLjiAvhkvo"
    private static let session = URLSession.shared
    private static var decoder: JSONDecoder {
    let decoder = JSONDecoder()
    return decoder
    } 

    ///   - title: Search term, e.g. "la la land"
    ///   - overview: description of the movie, still thinking about implementing this
    /// - Returns: An array of movies matching the specified parameters.
    public static func findMovies(
        title: String
//        overview: String

    ) async throws -> [Movie] {
        // TODO: Construct the url with URLComponents with these query params
        var components = URLComponents(string: "https://api.themoviedb.org/3/search/movie")
        components?.queryItems = [URLQueryItem(name: "query", value: "\(title)")
        ]
        
        // TODO: Construct the URLRequest
        //   - http method: "GET"
        //   - "Authorization" header: apiKey
        //   - "accept" header: "application/json"
        guard let url = components?.url else { fatalError("Invalid URL") }
        let headers = [
          "accept": "application/json",
          "Authorization": apiKey
        ]
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        // TODO: Make the request with URLSession
        //   - be sure to use the `data(for: request)` method
        let (data, _) = try await session.data(for: request)
//        print("\(data)")
       printData(data: data)
//        print("\(url)")
   
        
        // TODO: Decode the response using the decoder instantiated above
        let response = try decoder.decode(TMDBResponse.self, from: data)
        // TODO: Return the movies array from the TMDBResponse
//        print("\(response.results)")

        return response.results
        
    }
    
        /// Helper method to print the JSON data without decoding
        /// Very helpful when debugging
    private static func printData(data: Data) {
        let string = String(data: data, encoding: .utf8)!
        print("Received Data:")
        print(string)
    }

}

