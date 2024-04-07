//
//  Extensions.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 02/04/24.
//

import Foundation
import domain


extension MoviesMainViewModel.State: Updatable {
    
    func copy(
        loading: Bool? = nil,
        appError: AppError? = nil,
        popularMovies: [Movie]? = nil,
        nowPlayingMovies: [Movie]? = nil,
        topRatedMovies: [Movie]? = nil,
        upcomingMovies: [Movie]? = nil,
        selectedId: Int? = nil
    ) -> MoviesMainViewModel.State {
        return MoviesMainViewModel.State(
            loading: loading ?? self.loading,
            appError: appError ?? self.appError,
            popularMovies: popularMovies ?? self.popularMovies,
            nowPlayingMovies: nowPlayingMovies ?? self.nowPlayingMovies,
            topRatedMovies: topRatedMovies ?? self.topRatedMovies,
            upcomingMovies: upcomingMovies ?? self.upcomingMovies,
            selectedId: selectedId ?? self.selectedId
        )
    }
    
}
