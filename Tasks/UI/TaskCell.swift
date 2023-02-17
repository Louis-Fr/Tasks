//
//  TaskCell.swift
//  Tasks
//
//  Created by Louis REY on 17/02/2023.
//

import SwiftUI

struct TaskCell: View {
    let task: Task
    
    var body: some View {
        HStack {
            Text(task.name)
                .font(.title2)
            Spacer()
            Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                .font(.title)
        }.padding()
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskCell(task: Task(name: "test"))
            TaskCell(task: Task(name: "test", isDone: true))
        }
        .previewLayout(.fixed(width: 500.0, height: 100.0))
    }
}
