//
//  MoviesMainViewModel.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import Foundation
import domain
import usecases

class MoviesMainViewModel: ViewModel {
    private let fetchMoviesUseCase: FetchMoviesUseCase
    private let countMoviesUseCase: CountMoviesUseCase
    private let getMoviesUseCase: GetMoviesUseCase
    private let insertMoviesUseCase: InsertMoviesUseCase
    
    @Published
    var state: State = State()
    
    init(
        fetchMoviesUseCase: FetchMoviesUseCase,
        countMoviesUseCase: CountMoviesUseCase,
        getMoviesUseCase: GetMoviesUseCase,
        insertMoviesUseCase: InsertMoviesUseCase) {
            self.fetchMoviesUseCase = fetchMoviesUseCase
            self.countMoviesUseCase = countMoviesUseCase
            self.getMoviesUseCase = getMoviesUseCase
            self.insertMoviesUseCase = insertMoviesUseCase
            dataDownload()
        }
    
    func sendEvent(event: MainScreenEvent) {
        switch event {
        case .onItemSelected(let itemId):
            state.update { s in s.copy(selectedId: itemId)}
        }
    }
    
    fileprivate func dataDownload(){
        countMovies(sortedAs: MoviesMainViewModel.POPULAR) { endpoint in
            self.fetchPopularMovies(endpoint: endpoint)
        }
        countMovies(sortedAs: MoviesMainViewModel.NOW_PLAYING) { endpoint in
            self.fetchNowPlayingMovies(endpoint: endpoint)
        }
        countMovies(sortedAs: MoviesMainViewModel.TOP_RATED) { endpoint in
            self.fetchTopRatedMovies(endpoint: endpoint)
        }
        countMovies(sortedAs: MoviesMainViewModel.UPCOMING) { endpoint in
            self.fetchUpcomingMovies(endpoint: endpoint)
        }
    }
    
    fileprivate func countMovies(sortedAs: String, ifEmpty: @escaping (String) -> Void){
        countMoviesUseCase.execute(sortedAs: sortedAs) { result in
            result.fold { count in
                if count == 0 { ifEmpty(sortedAs) }
            } onFailure: { appError in
                self.state.update { s in s.copy(appError: appError)}
            }
            
        }
    }
    
    fileprivate func fetchPopularMovies(endpoint: String) {
        run {
            fetchMoviesUseCase.execute(endpoint: endpoint) { result in
                result.foldForPublish{  popularMovies in
                    self.insertMovies(movies: popularMovies)
                } onFailure: { appError in
                    self.state.update { s in s.copy(appError: appError)}
                }
            }
        }
    }
    
    fileprivate func fetchNowPlayingMovies(endpoint: String) {
        run {
            fetchMoviesUseCase.execute(endpoint: endpoint) { result in
                result.foldForPublish{  nowPlayingMovies in
                    self.insertMovies(movies: nowPlayingMovies)
                } onFailure: { appError in
                    self.state.update { s in s.copy(appError: appError)}
                }
            }
        }
    }
    
    
    private func fetchTopRatedMovies(endpoint: String) {
        run {
            fetchMoviesUseCase.execute(endpoint: endpoint) { result in
                result.foldForPublish{ topRatedMovies in
                    self.insertMovies(movies: topRatedMovies)
                } onFailure: { appError in
                    self.state.update { s in s.copy(appError: appError)}
                }
            }
        }
    }
    
    private func fetchUpcomingMovies(endpoint: String) {
        run {
            fetchMoviesUseCase.execute(endpoint: endpoint) { result in
                result.foldForPublish{  upcomingMovies in
                    self.insertMovies(movies: upcomingMovies)
                } onFailure: { appError in
                    self.state.update { s in s.copy(appError: appError)}
                }
            }
        }
    }
    
    private func insertMovies(movies: [Movie]) {
        insertMoviesUseCase.execute(movies: movies) { result in
            result.fold { wasSaved in
                if wasSaved {
                    self.getMovies()
                }
            } onFailure: { appError in
                self.state.update { s in s.copy(appError: appError)}
            }
            
        }
    }
    
    private func getMovies() {
        getMoviesUseCase.execute { result in
            result.fold { movies in
                self.state.update { s in s.copy(
                    popularMovies: movies.filter({ movie in movie.sortAs == MoviesMainViewModel.POPULAR }),
                    nowPlayingMovies: movies.filter({ movie in movie.sortAs == MoviesMainViewModel.NOW_PLAYING }),
                    topRatedMovies: movies.filter({ movie in movie.sortAs == MoviesMainViewModel.TOP_RATED }),
                    upcomingMovies: movies.filter({ movie in movie.sortAs == MoviesMainViewModel.UPCOMING })
                )}
            } onFailure: { appError in
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
    
    private static let POPULAR = "popular"
    private static let NOW_PLAYING = "now_playing"
    private static let TOP_RATED = "top_rated"
    private static let UPCOMING = "upcoming"
    
    
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
