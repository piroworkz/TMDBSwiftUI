//
//  ViewModelModule.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import Foundation


class ViewModelModule {
    
    static let inject: ViewModelModule = ViewModelModule()
    
    private init() {
    }
    
    func moviesMain() -> MoviesMainViewModel {
        return MoviesMainViewModel(getMoviesUseCase: UseCasesModule.inject.getMoviesUseCase)
    }
    
    
    func movieDetail(movieId: Int) -> MovieDetailViewModel {
        return  MovieDetailViewModel(
            id: movieId,
            getMovieDetailsUseCase: UseCasesModule.inject.getMovieDetailUseCase,
            getMovieImagesUseCase: UseCasesModule.inject.getMoviesImagesUseCase,
            getMoviesRecommendationsUseCase: UseCasesModule.inject.getMovieRecommendationsUseCase
        )
    }
}

