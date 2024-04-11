//
//  DBMappers.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 11/04/24.
//

import domain
import CoreData

extension Movie {
    
    func toDatabase(db: NSManagedObjectContext) {
        let dbMovie = DbMovie(entity: DbMovie.entity(), insertInto: db)
        dbMovie.id = Int64(self.id)
        dbMovie.posterPath = self.posterPath
        dbMovie.title = self.title
        dbMovie.sortAs = self.sortAs
    }
    
}


extension MovieDetail {
    
    func toDatabase(db: NSManagedObjectContext) {
        let dbDetail = DbMovieDetail(entity: DbMovieDetail.entity(), insertInto: db)
        dbDetail.id = Int64(self.id)
        dbDetail.adult = self.adult
        
    }
}

extension DbMovie {
    
    func toDomain() -> Movie {
        Movie(
            id: Int(self.id),
            posterPath: self.posterPath ?? "",
            title: self.title ?? "",
            sortAs: self.sortAs ?? ""
        )
    }
}

func tryCatch<T>(_ action: () throws -> T) -> Result<T, AppError> {
    do {
        let result = try action()
        return .success(result)
    } catch let error {
        return .failure(error.toAppError())
    }
}
