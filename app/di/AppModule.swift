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
    
    private var remote: MoviesRemoteDataSource
    private var local: MoviesLocalDataSource
    var repository: MoviesRepository
    
    private init() {
        self.local = MoviesCoreDataSource(db: CoreDataStack.shared.container.viewContext)
        self.remote = RemoteMoviesDataSource()
        self.repository = MoviesRepository(remote: self.remote, local: self.local)
    }
    
}
