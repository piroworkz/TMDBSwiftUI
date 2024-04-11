//
//  Movie.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

public struct Movie: Identifiable {
    public let id: Int
    public let posterPath: String
    public let title: String
    public let sortAs: String
    
    public init(
        id: Int,
        posterPath: String,
        title: String,
        sortAs: String
    ) {
        self.id = id
        self.posterPath = posterPath
        self.title = title
        self.sortAs = sortAs
    }
}
