//
//  Task.swift
//  Tasks
//
//  Created by louis on 15/02/2023.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    let name: String
    var isDone = false
}
