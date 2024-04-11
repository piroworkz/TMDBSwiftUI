//
//  DbPoster+CoreDataProperties.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 11/04/24.
//
//

import Foundation
import CoreData


extension DbPoster {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DbPoster> {
        return NSFetchRequest<DbPoster>(entityName: "DbPoster")
    }

    @NSManaged public var path: String?

}

extension DbPoster : Identifiable {

}
