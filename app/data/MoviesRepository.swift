//
//  MoviesRepository.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//
import Foundation

class MoviesRepository {
    private let remote: MoviesDataSource
    
    init(remote: MoviesDataSource) {
        self.remote = remote
    }
    
    func getMovies(endpoint: String, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        remote.getMovies(endpoint: endpoint, completionHandler: completionHandler)
    }
    
    func getMovieDetails(by id: Int, completionHandler: @escaping(_ result: Result<MovieDetail, AppError>) -> Void) {
        remote.getMovieDetails(by: id, completionHandler: completionHandler)
    }
    
    func getMovieImages(by id: Int, completionHandler: @escaping (Result<[Poster], AppError>) -> Void) {
        remote.getMovieImages(by: id, completionHandler: completionHandler)
    }
    
    func getMovieRecommendations(by id: Int, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        remote.getMovieRecommendations(by: id, completionHandler: completionHandler)
    }
}

