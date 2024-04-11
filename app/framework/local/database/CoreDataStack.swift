//
//  File.swift
//  TMDBSwiftUI
//
//  Created by David Luna on 08/04/24.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared: CoreDataStack = CoreDataStack()
    
    static var preview: CoreDataStack = {
        let result: CoreDataStack = CoreDataStack(inMemory: true)
        let viewContext: NSManagedObjectContext = result.container.viewContext
        for index in 0..<10 {
            let newItem = DbMovie(context: viewContext)
            newItem.id = Int64(index)
            newItem.title = "Title \(index)"
            newItem.posterPath = "Path \(index)"
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    private init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "TMDB")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
