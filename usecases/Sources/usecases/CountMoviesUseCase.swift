//
//  File.swift
//
//
//  Created by David Luna on 11/04/24.
//

import data
import domain

public class CountMoviesUseCase {
    private let repository: MoviesRepository
    
    public init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    public func execute(sortedAs: String, completionHandler: @escaping (Result<Int, AppError>) -> Void) {
        repository.countMovies(sortedAs: sortedAs, completionHandler: completionHandler)
    }
    
}
