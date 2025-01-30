//
//  UserReview.swift
//  Cinemates
//
//  Created by Sanyukta Lamsal on 11/30/23.
//

import Foundation

struct UserReview: Identifiable {
    let id = UUID()
    let title: String
    let posterURL: URL?
    let review: String
}
