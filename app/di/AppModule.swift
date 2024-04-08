//
//  AppModule.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 03/04/24.
//

import Foundation
import data


class AppModule {
    
    static let inject: AppModule = AppModule()
    
    private var remote: MoviesDataSource
    var repository: MoviesRepository
    
    private init() {
        self.remote = RemoteMoviesDataSource()
        self.repository = MoviesRepository(remote: self.remote)
    }
    
}
