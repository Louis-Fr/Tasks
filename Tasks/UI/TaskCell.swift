//
//  TaskCell.swift
//  Tasks
//
//  Created by Louis REY on 17/02/2023.
//

import SwiftUI

struct TaskCell: View {
    
    @State var taskManager = TaskManager()
    @State var task: Task
    
    var body: some View {
        VStack {
            Text(taskManager.taskList.description)
            Text(task.name)
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task(name: "test"))
    }
}
