//
//  TaskModel.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 26/03/2023.
//

import Foundation

// Immutable Struct
struct TaskModel: Identifiable, Codable {
    let id: String
    let title: String
    let isChecked: Bool
    
    init(id: String = UUID().uuidString, title: String, isChecked: Bool) {
        self.id = id
        self.title = title
        self.isChecked = isChecked
    }
    
    func updateCompletion() -> TaskModel {
        return TaskModel(id: id, title: title, isChecked: !isChecked)
    }
}

