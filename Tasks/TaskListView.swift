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
    
    @State var taskList = [
        Task(name: "Terminer le cours"),
        Task(name: "Reprendre le sport"),
        Task(name: "Arreter de fumer")
    ]
    
    var body: some View {
        VStack {
            HStack {
                TextField("Nouvelle tâche", text: $newTaskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Button(action: createNewTask, label: {
//                    Image(systemName: "plus")
//                }).disabled(newTaskName.count == 0)
            }.padding()
            
            VStack(content: HorizontalAlignment.leading) {
                ForEach(taskList) { task in
                    
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
