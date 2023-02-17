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
    
    /// Récupérer des objets dans la BDD = récupérer la liste des taches
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
    
    /// Ajouter de nouveau objet dans la BDD
    func addNewTask(task: Task) {
        let newTask = CDTask(context: context)
        newTask.id = task.id
        newTask.name = task.name
        newTask.isDone = task.isDone
        saveData()
    }
    
    /// Mettre à jour un objet
    func updateTask(task: Task) {
        if let existingTask = fetchCDTask(withId: task.id) {
            existingTask.name = task.name
            existingTask.isDone = task.isDone
            saveData()
        }
    }
    
    
    
    
    
    /// Modifier des objets existants
    private func fetchCDTask(withId taskId: UUID) -> CDTask? {
        let fetchRequest: NSFetchRequest<CDTask> = CDTask.fetchRequest()
        /// Predicat
        fetchRequest.predicate = NSPredicate(format: "id == %@", taskId as CVarArg)
        fetchRequest.fetchLimit = 1
        let fetchResult: [CDTask]? = try? context.fetch(fetchRequest)
        return fetchResult?.first
    }
    
    private func saveData() {
        if context.hasChanges {
            do {
              try  context.save()
            } catch {
                print("Erreur pendant la sauvegarde de CoreData : \(error.localizedDescription)")
            }
        }
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
