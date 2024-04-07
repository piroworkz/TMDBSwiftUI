//
//  GetMoviesUseCase.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

class GetMoviesUseCase{
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    func execute(endpoint: String, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        repository.getMovies(endpoint: endpoint, completionHandler: completionHandler   )
    }
    
}
