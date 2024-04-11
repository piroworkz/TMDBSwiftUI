//
//  GetMoviesUseCase.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import domain
import data


public class FetchMoviesUseCase{
    private let repository: MoviesRepository
    
    public init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    public func execute(endpoint: String, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        repository.fetchMovies(endpoint: endpoint, completionHandler: completionHandler   )
    }
    
}
