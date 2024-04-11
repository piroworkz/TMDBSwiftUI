//
//  File.swift
//
//
//  Created by David Luna on 11/04/24.
//
import data
import domain

public class InsertMoviesUseCase {
    private let repository: MoviesRepository
    
    public init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    public func execute(movies: [Movie], completionHandler: @escaping (Result<Bool, AppError>) -> Void) {
        repository.insertMovies(movies: movies, completionHandler: completionHandler)
    }
    
}
