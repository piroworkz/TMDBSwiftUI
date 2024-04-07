//
//  Extensions.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import Foundation
import domain

extension MovieDetailViewModel.State: Updatable {
    
    func copy(
        loading: Bool? = nil,
        appError: AppError? = nil,
        movie: MovieDetail? = nil,
        posters: [Poster]? = nil,
        recommendations: [Movie]? = nil,
        selectedId: Int? = nil
    ) -> MovieDetailViewModel.State {
        return MovieDetailViewModel.State(
            loading: loading ?? self.loading,
            appError: appError ?? self.appError,
            movie: movie ?? self.movie,
            posters: posters ?? self.posters,
            recommendations: recommendations ?? self.recommendations,
            selectedId: selectedId ?? self.selectedId
        )
    }
    
}
