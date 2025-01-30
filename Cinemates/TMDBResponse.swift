//
//  TMDBResponse.swift
//  Cinemates
//
//  Created by Sanyukta Lamsal on 11/27/23.
//

import Foundation

struct TMDBResponse: Codable{
    let results: [Movie]
}

struct Movie: Codable, Identifiable, Hashable{
    let id: Int?
    let title: String?
    let poster_path: String?
    let backdrop_path: String?
    let overview: String?
    let vote_count: Int?
    

    var backdropURL: URL? {
        if let backdrop_path = backdrop_path{
            return URL(string: "https://image.tmdb.org/t/p/w500\(backdrop_path)")
        }
        else{
            return nil
        }
    }
      
        var posterURL: URL? {
            if let  poster_path = poster_path{
                return URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")
            }
            else{
                return nil
            }
        }
    
}
