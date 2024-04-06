//
//  MovieDetailViewModel.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import Foundation

class MovieDetailViewModel: ViewModel {
    
    private var getMovieDetailsUseCase: GetMovieDetailUseCase
    private var getMovieImagesUseCase: GetMovieImagesUseCase
    private var getMoviesRecommendationsUseCase: GetMovieRecommendationsUseCase
    
    @Published
    var state: State = State()
    
    var id: Int?
    
    init(
        id: Int,
        getMovieDetailsUseCase: GetMovieDetailUseCase,
        getMovieImagesUseCase: GetMovieImagesUseCase,
        getMoviesRecommendationsUseCase: GetMovieRecommendationsUseCase
    ) {
        self.getMovieDetailsUseCase = getMovieDetailsUseCase
        self.getMovieImagesUseCase = getMovieImagesUseCase
        self.getMoviesRecommendationsUseCase = getMoviesRecommendationsUseCase
        self.id = id
        if let movieId = self.id {
            fetchMovieDetails(by: movieId)
            fetchMovieImages(by: movieId)
            fetchMovieRecommendations(by: movieId)
        }
    }
    
    fileprivate func fetchMovieDetails(by id: Int){
        getMovieDetailsUseCase.execute(id: id) { result in
            result.foldForPublish { movieDetails in
                self.state.update { s in s.copy(movie: movieDetails)}
            } onFailure: { appError in
                self.state.update { s in s.copy(appError: appError)}
            }
            
        }
    }
    
    private func fetchMovieImages(by id: Int) {
        getMovieImagesUseCase.execute(by: id) { result in
            result.foldForPublish { posters in
                self.state.update { s in s.copy(posters: posters) }
            } onFailure: { appError in
                self.state.update { s in s.copy(appError: appError)}
            }
        }
    }
    
    private func fetchMovieRecommendations(by id: Int) {
        getMoviesRecommendationsUseCase.execute(by: id) { result in
            result.foldForPublish { movies in
                self.state.update { s in s.copy(recommendations: movies) }
            } onFailure: { appError in
                print(appError)
                self.state.update { s in s.copy(appError: appError)}
            }
        }
    }
    
    private func run(code: () throws -> Void) {
        do {
            state.update { s in s.copy(loading: true) }
            try code()
            state.update { s in s.copy(loading: false) }
        } catch {
            state.update { s in s.copy(loading: false, appError: error.toAppError()) }
        }
    }
    
    struct State {
        let loading: Bool
        let appError: AppError?
        let movie: MovieDetail?
        let posters: [Poster]
        let recommendations: [Movie]
        let selectedId: Int?
        
        init(
            loading: Bool = false,
            appError: AppError? = nil,
            movie: MovieDetail? = nil,
            posters: [Poster] = [],
            recommendations: [Movie] = [],
            selectedId: Int? = nil
        ) {
            self.loading = loading
            self.appError = appError
            self.movie = movie
            self.posters = posters
            self.recommendations = recommendations
            self.selectedId = selectedId
        }
    }
    
}
