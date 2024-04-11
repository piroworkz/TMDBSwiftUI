//
//  MoviesRepository.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import domain

public class MoviesRepository {
    private let remote: MoviesRemoteDataSource
    private let local: MoviesLocalDataSource
    
    public init(remote: MoviesRemoteDataSource, local: MoviesLocalDataSource) {
        self.remote = remote
        self.local = local
    }
    
    public func fetchMovies(endpoint: String, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        remote.fectchMovies(endpoint: endpoint, completionHandler: completionHandler)
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
    
    public  func insertMovies(movies: [Movie], completionHandler: @escaping (Result<Bool, AppError>) -> Void) {
        local.insertMovies(movies: movies, completionHandler: completionHandler)
    }
    
    public func getMovies(completionHandler: @escaping (Result<[Movie], AppError>) -> Void) {
        local.getMovies(completionHandler: completionHandler)
    }
    
    public func countMovies(sortedAs: String, completionHandler: @escaping (Result<Int, AppError>) -> Void) {
        local.countMovies(sortedAs: sortedAs, completionHandler: completionHandler)
    }
    
}

