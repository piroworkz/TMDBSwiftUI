//
//  MOviesDao.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 11/04/24.
//

import domain

public protocol MoviesLocalDataSource {
    func insertMovies(movies: [Movie], completionHandler: @escaping (Result<Bool, AppError>) -> Void)
    func getMovies(completionHandler: @escaping (Result<[Movie], AppError>) -> Void)
    func countMovies(sortedAs: String, completionHandler: @escaping (Result<Int, AppError>) -> Void)
}
