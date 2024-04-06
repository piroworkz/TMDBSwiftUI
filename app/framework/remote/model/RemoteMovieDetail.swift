//
//  RemoteMovieDetail.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import Foundation

struct RemoteMovieDetail: Codable {
    let adult: Bool
    let backdrop_path: String?
    let homepage: String?
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}
