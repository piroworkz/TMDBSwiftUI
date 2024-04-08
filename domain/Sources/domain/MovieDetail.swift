//
//  MovieDetail.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

public struct MovieDetail {
    public let adult: Bool
    public let backdropPath: String?
    public let homepage: String?
    public let id: Int
    public let originalLanguage: String
    public let originalTitle: String
    public let overview: String
    public let popularity: Double
    public let posterPath: String
    public let releaseDate: String
    public let status: String
    public let tagline: String
    public let title: String
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int
    
    public init(adult: Bool, backdropPath: String?, homepage: String?, id: Int, originalLanguage: String, originalTitle: String, overview: String, popularity: Double, posterPath: String, releaseDate: String, status: String, tagline: String, title: String, video: Bool, voteAverage: Double, voteCount: Int) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.homepage = homepage
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}

