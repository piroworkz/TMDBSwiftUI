//
//  ViewModelModule.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import Foundation


class ViewModelModule {
    
    static let inject: ViewModelModule = ViewModelModule()
    
    lazy var movieDetailViewModel: (Int) -> MovieDetailViewModel = { [unowned self] id in
        print("creating viewModel")
        return MovieDetailViewModel(
            id: id,
            getMovieDetailsUseCase: UseCasesModule.inject.getMovieDetailUseCase,
            getMovieImagesUseCase: UseCasesModule.inject.getMoviesImagesUseCase,
            getMoviesRecommendationsUseCase: UseCasesModule.inject.getMovieRecommendationsUseCase
        )
    }
    
    lazy var moviesMainViewModel: MoviesMainViewModel = MoviesMainViewModel(getMoviesUseCase: UseCasesModule.inject.getMoviesUseCase)
    
    private init() {
    }
    
}
