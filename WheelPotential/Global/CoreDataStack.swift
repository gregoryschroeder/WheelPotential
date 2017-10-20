//
//  CoreData.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/20/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack: NSObject {
    private override init() {
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WheelPotential")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // TODO: Add error handling
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data get context
    
    class func getContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
       
    // MARK: - Core Data Saving support
    
    class func saveContext () {
        let context = CoreDataStack.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: Add error handling
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
