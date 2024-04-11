//
//  DbMovie+CoreDataProperties.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 10/04/24.
//
//

import Foundation
import CoreData


extension DbMovie {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<DbMovie> {
        return NSFetchRequest<DbMovie>(entityName: "DbMovie")
    }
    
    @nonobjc public class func countRequest(where predicate: () -> NSPredicate) -> NSFetchRequest<DbMovie> {
        let request = NSFetchRequest<DbMovie>(entityName: "DbMovie")
        request.predicate = predicate()
        return request
    }
    
    
    @NSManaged public var id: Int64
    @NSManaged public var posterPath: String?
    @NSManaged public var title: String?
    @NSManaged public var sortAs: String?
    
}

extension DbMovie : Identifiable {
    
}
