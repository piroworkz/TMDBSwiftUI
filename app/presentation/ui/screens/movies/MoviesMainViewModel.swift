//
//  MoviesMainViewModel.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import Foundation

class MoviesMainViewModel: ViewModel {
    private let getMoviesUseCase: GetMoviesUseCase
    
    @Published
    var state: State = State()
    
    init(getMoviesUseCase: GetMoviesUseCase) {
        print("main vm init")
        self.getMoviesUseCase = getMoviesUseCase
        dataDownload()
    }
    
    func sendEvent(event: MainScreenEvent) {
        switch event {
        case .onItemSelected(let itemId):
            print("selected id: \(itemId)")
            state.update { s in s.copy(selectedId: itemId)}
        }
    }
    
    fileprivate func dataDownload(){
        fetchPopularMovies()
        fetchNowPlayingMovies()
        fetchTopRatedMovies()
        fetchUpcomingMovies()
    }
    
    fileprivate func fetchPopularMovies() {
        run {
            getMoviesUseCase.execute(endpoint: "popular") { result in
                result.foldForPublish{  popularMovies in
                    self.state.update { s in s.copy(popularMovies: popularMovies)}
                } onFailure: { appError in
                    self.state.update { s in s.copy(appError: appError)}
                }
            }
        }
    }
    
    fileprivate func fetchNowPlayingMovies() {
        run {
            getMoviesUseCase.execute(endpoint: "now_playing") { result in
                result.foldForPublish{  nowPlayingMovies in
                    self.state.update { s in s.copy(nowPlayingMovies: nowPlayingMovies)}
                } onFailure: { appError in
                    self.state.update { s in s.copy(appError: appError)}
                }
            }
        }
    }
    
    
    private func fetchTopRatedMovies() {
        run {
            getMoviesUseCase.execute(endpoint: "top_rated") { result in
                result.foldForPublish{ topRatedMovies in
                    self.state.update { s in s.copy(topRatedMovies: topRatedMovies)}
                } onFailure: { appError in
                    self.state.update { s in s.copy(appError: appError)}
                }
            }
        }
    }
    
    private func fetchUpcomingMovies() {
        run {
            getMoviesUseCase.execute(endpoint: "upcoming") { result in
                result.foldForPublish{  upcomingMovies in
                    self.state.update { s in s.copy(upcomingMovies: upcomingMovies)}
                } onFailure: { appError in
                    self.state.update { s in s.copy(appError: appError)}
                }
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
        let popularMovies: [Movie]
        let nowPlayingMovies: [Movie]
        let topRatedMovies: [Movie]
        let upcomingMovies: [Movie]
        let sectionTitles: [String]
        let selectedId: Int?
        
        init(
            loading: Bool = false,
            appError: AppError? = nil,
            popularMovies: [Movie] = [],
            nowPlayingMovies: [Movie] = [],
            topRatedMovies: [Movie] = [],
            upcomingMovies: [Movie] = [],
            sectionTitles: [String] = ["Popular", "Now Playing", "Top Rated", "Upcoming"],
            selectedId: Int? = nil) {
                self.loading = loading
                self.appError = appError
                self.popularMovies = popularMovies
                self.nowPlayingMovies = nowPlayingMovies
                self.topRatedMovies = topRatedMovies
                self.upcomingMovies = upcomingMovies
                self.sectionTitles = sectionTitles
                self.selectedId = selectedId
            }
    }
}
