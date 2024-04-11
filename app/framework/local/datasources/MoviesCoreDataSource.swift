//
//  MoviesDao.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 11/04/24.
//

import CoreData
import domain
import data

class MoviesCoreDataSource: MoviesLocalDataSource {
    
    private let dao: NSManagedObjectContext
    
    init(db: NSManagedObjectContext) {
        self.dao = db
    }
    
    func insertMovies(movies: [Movie], completionHandler: @escaping (Result<Bool, AppError>) -> Void){
        tryCatch {
            for movie in movies { movie.toDatabase(db: dao) }
            try dao.save()
            return (try dao.count(for: DbMovie.fetchRequest())) >= movies.count
        }.fold { wasAcknowledged in
            completionHandler(.success(wasAcknowledged))
        } onFailure: { error in
            completionHandler(.failure(error))
        }
    }
    
    func getMovies(completionHandler: @escaping (Result<[Movie], AppError>) -> Void) {
        tryCatch {
            return try dao.fetch(DbMovie.fetchRequest())
        }.fold { movies in
            let domainMovies = movies.map { dbMovie in dbMovie.toDomain() }
            completionHandler(.success(domainMovies))
        } onFailure: { error in
            completionHandler(.failure(error))
        }
    }
    
    func countMovies(sortedAs: String, completionHandler: @escaping (Result<Int, AppError>) -> Void) {
        tryCatch {
            try dao.count(for:DbMovie.countRequest(where: { NSPredicate(format: "sortAs == %@", sortedAs) }))
        }.fold { count in
            completionHandler(.success(count))
        } onFailure: { error in
            completionHandler(.failure(error))
        }
        
    }
    
}
