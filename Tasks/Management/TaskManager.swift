//
//  TaskManager.swift
//  Tasks
//
//  Created by louis on 11/02/2023.
//

import Foundation

struct TaskManager {
    let tasklist: [Task]
    let storage: CoreDataStorage = CoreDataStorage()
    
    /// Je demande au storage de récupérer les taches et de les stcoker dans mon tableau en local
    /// Gestion des données -> Base de donnée
    init() {
        tasklist = storage.fetchTaskList()
    }
}
