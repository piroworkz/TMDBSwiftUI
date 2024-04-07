//
//  GetMovieImagesUseCase.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import Foundation
import domain
import data

public class GetMovieImagesUseCase {
    
    private let repository: MoviesRepository
    
    public init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    public func execute(by id: Int, completionHandler: @escaping (Result<[Poster], AppError>) -> Void) {
        repository.getMovieImages(by: id, completionHandler: completionHandler)
    }
    
}
