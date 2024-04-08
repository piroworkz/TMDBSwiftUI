//
//  GetMovieDetailUseCase.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import domain
import data

public class GetMovieDetailUseCase{
    private let repository: MoviesRepository
    
    public init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    public func execute(id: Int, completionHandler: @escaping (Result<MovieDetail, AppError>) -> Void) {
        repository.getMovieDetails(by: id, completionHandler: completionHandler)
    }
    
}
