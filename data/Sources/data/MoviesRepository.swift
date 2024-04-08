//
//  MoviesRepository.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import domain

public class MoviesRepository {
    private let remote: MoviesDataSource
    
    public init(remote: MoviesDataSource) {
        self.remote = remote
    }
    
    public func getMovies(endpoint: String, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        remote.getMovies(endpoint: endpoint, completionHandler: completionHandler)
    }
    
    public func getMovieDetails(by id: Int, completionHandler: @escaping(_ result: Result<MovieDetail, AppError>) -> Void) {
        remote.getMovieDetails(by: id, completionHandler: completionHandler)
    }
    
    public func getMovieImages(by id: Int, completionHandler: @escaping (Result<[Poster], AppError>) -> Void) {
        remote.getMovieImages(by: id, completionHandler: completionHandler)
    }
    
    public func getMovieRecommendations(by id: Int, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        remote.getMovieRecommendations(by: id, completionHandler: completionHandler)
    }
}

