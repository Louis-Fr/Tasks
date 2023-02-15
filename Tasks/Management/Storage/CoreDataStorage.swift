//
//  CoreDataStorage.swift
//  Tasks
//
//  Created by louis on 11/02/2023.
//

import Foundation
import CoreData

class CoreDataStorage {
    
    /// Setting up from developper documentation
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "DataModel")
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
        }()
    
    var context: NSManagedObjectContext {
       return persistentContainer.viewContext
    }
    
    func fetchTaskList() -> [Task] {
        let fetchRequest: NSFetchRequest<CDTask> = CDTask.fetchRequest()
        
        return []
    }
}
