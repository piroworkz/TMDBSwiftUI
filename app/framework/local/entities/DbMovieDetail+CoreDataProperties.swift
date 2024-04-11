//
//  DbMovieDetail+CoreDataProperties.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 11/04/24.
//
//

import Foundation
import CoreData


extension DbMovieDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DbMovieDetail> {
        return NSFetchRequest<DbMovieDetail>(entityName: "DbMovieDetail")
    }

    @NSManaged public var id: Int64
    @NSManaged public var adult: Bool
    @NSManaged public var backdropPath: String?
    @NSManaged public var homepage: String?
    @NSManaged public var originalLanguage: String?
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Double
    @NSManaged public var posterPath: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var status: String?
    @NSManaged public var tagline: String?
    @NSManaged public var title: String?
    @NSManaged public var video: Bool
    @NSManaged public var voteAverage: Double
    @NSManaged public var voteCount: Int64

}

extension DbMovieDetail : Identifiable {

}
