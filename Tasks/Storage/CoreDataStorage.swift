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
    
    /// Pour récupérer la liste des taches depuis la base de donnée
    func fetchTaskList() -> [Task] {
        let taskList: [Task]
        let fetchRequest: NSFetchRequest<CDTask> = CDTask.fetchRequest()
        /// Transformer la requête en résultat
        if let rawTaskList = try? context.fetch(fetchRequest) {
            
            /// Transformer objet de type CDTask -> Task
            taskList = rawTaskList.compactMap({ (rawTask: CDTask) -> Task? in
                
                Task(fromCoreDataObject: rawTask)
            })
            
        } else {
            taskList = []
        }
        /// Il charge les données et retourne un résultat
        
        return taskList
    }
}

extension Task {
    
    init?(fromCoreDataObject coreDataObject: CDTask) {
        
        guard let id = coreDataObject.id,
        let name = coreDataObject.name
        else { return nil }
        
        self.id = id
        self.name = name
        self.isDone = coreDataObject.isDone
    }
}
