//
//  ContentView.swift
//  Tasks
//
//  Created by louis on 11/02/2023.
//

import SwiftUI

struct TaskListView: View {
    
    @State var newTaskName: String = ""
    @State var taskManager = TaskManager()
    
    /// Pas de persistance, revient à 0 
//    @State var taskList = [
//        Task(name: "Terminer le cours"),
//        Task(name: "Reprendre le sport"),
//        Task(name: "Arreter de fumer")
//    ]
    
    var body: some View {
        VStack {
            HStack {
                TextField("Nouvelle tâche", text: $newTaskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: createNewTask, label: {
                    Image(systemName: "plus")
                }).disabled(newTaskName.count == 0)
            }.padding()
            
            VStack(alignment: HorizontalAlignment.leading) {
                ForEach(taskManager.taskList) { task in
                    TaskCell(task: task)
                        .onTapGesture {
                            userTouchTask(task)
                        }
                }
            }
        }
    }
    
    
    func createNewTask() {
        if newTaskName.count > 0 {
            taskManager.addTask(withName: newTaskName)
            newTaskName = ""
        }
    }
    
    
    func userTouchTask(_ task: Task) {
        taskManager.toggleTaskStatus(withId: task.id)
    }
}
struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
