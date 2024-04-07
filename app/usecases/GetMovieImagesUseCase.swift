//
//  GetMovieImagesUseCase.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//
import Foundation

class GetMovieImagesUseCase {
    
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    func execute(by id: Int, completionHandler: @escaping (Result<[Poster], AppError>) -> Void) {
        repository.getMovieImages(by: id, completionHandler: completionHandler)
    }
    
}
