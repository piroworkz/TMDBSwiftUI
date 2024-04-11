//
//  RemoteMappers.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import Foundation
import domain

extension RemoteMovie {
    func toDomain(sortAs: String) -> Movie {
        Movie(
            id: self.id,
            posterPath: self.poster_path.buildThumbPath(),
            title: self.title .orEmpty(),
            sortAs: sortAs
        )
    }
}

extension RemoteMovieDetail {
    
    func toDomain() -> MovieDetail {
        MovieDetail(
            adult: self.adult,
            backdropPath: self.backdrop_path.buildThumbPath(),
            homepage: self.homepage.orEmpty(),
            id: self.id,
            originalLanguage: self.original_language,
            originalTitle: self.original_title,
            overview: self.overview,
            popularity: self.popularity,
            posterPath: self.poster_path.buildThumbPath(),
            releaseDate: self.release_date,
            status: self.status,
            tagline: self.tagline,
            title: self.title,
            video: self.video,
            voteAverage: self.vote_average,
            voteCount: self.vote_count
        )
    }
}

extension RemotePoster {
    
    func toDomain() -> Poster {
        Poster(path: self.file_path.buildPosterPath())
    }
}
