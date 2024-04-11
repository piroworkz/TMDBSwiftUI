//
//  File.swift
//
//
//  Created by David Luna on 11/04/24.
//

import data
import domain

public class GetMoviesUseCase {
    private let repository: MoviesRepository
    
    public init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    public func execute(completionHandler: @escaping (Result<[Movie], AppError>) -> Void) {
        repository.getMovies(completionHandler: completionHandler)
    }
}
