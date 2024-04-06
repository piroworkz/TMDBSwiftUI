//
//  GetMovieRecommendationsUseCase.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import Foundation


class GetMovieRecommendationsUseCase {
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    func execute(by id: Int, completionHandler: @escaping(_ result: Result<[Movie], AppError>) -> Void) {
        repository.getMovieRecommendations(by: id, completionHandler: completionHandler)
    }
    
}
