//
//  UseCasesModule.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 04/04/24.
//

import Foundation
import usecases

class UseCasesModule {
    
    static let inject: UseCasesModule = UseCasesModule()
    
    lazy var fetchMoviesUseCase: FetchMoviesUseCase = FetchMoviesUseCase(repository: AppModule.inject.repository)
    lazy var getMovieDetailUseCase: GetMovieDetailUseCase = GetMovieDetailUseCase(repository: AppModule.inject.repository)
    lazy var getMoviesImagesUseCase: GetMovieImagesUseCase = GetMovieImagesUseCase(repository: AppModule.inject.repository)
    lazy var getMovieRecommendationsUseCase: GetMovieRecommendationsUseCase = GetMovieRecommendationsUseCase(repository: AppModule.inject.repository)
    lazy var countMoviesUSeCase = CountMoviesUseCase(repository: AppModule.inject.repository)
    lazy var insertMoviesUseCase = InsertMoviesUseCase(repository: AppModule.inject.repository)
    lazy var getMoviesUseCase = GetMoviesUseCase(repository: AppModule.inject.repository)
    
    private init() {
    }
    
}
