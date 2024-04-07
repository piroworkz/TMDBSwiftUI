//
//  UseCasesModule.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 04/04/24.
//

import Foundation
import domain
import usecases

class UseCasesModule {
    
    static let inject: UseCasesModule = UseCasesModule()
    
    lazy var getMoviesUseCase: GetMoviesUseCase = GetMoviesUseCase(repository: AppModule.inject.repository)
    lazy var getMovieDetailUseCase: GetMovieDetailUseCase = GetMovieDetailUseCase(repository: AppModule.inject.repository)
    lazy var getMoviesImagesUseCase: GetMovieImagesUseCase = GetMovieImagesUseCase(repository: AppModule.inject.repository)
    lazy var getMovieRecommendationsUseCase: GetMovieRecommendationsUseCase = GetMovieRecommendationsUseCase(repository: AppModule.inject.repository)
    
    private init() {
    }
    
}
