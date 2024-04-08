//
//  MoviesDataSource.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import domain

public protocol MoviesDataSource {
    func getMovies(endpoint: String, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void)
    func getMovieDetails(by id: Int, completionHandler: @escaping(_ result: Result<MovieDetail, AppError>) -> Void)
    func getMovieImages(by id: Int, completionHandler: @escaping (Result<[Poster], AppError>) -> Void)
    func getMovieRecommendations(by id: Int, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void)
}
