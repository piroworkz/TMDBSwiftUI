//
//  GetMovieDetailUseCase.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

class GetMovieDetailUseCase{
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    func execute(id: Int, completionHandler: @escaping (Result<MovieDetail, AppError>) -> Void) {
        repository.getMovieDetails(by: id, completionHandler: completionHandler)
    }
    
}
