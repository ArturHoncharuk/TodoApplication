//
//  TaskModel.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 26/03/2023.
//

import Foundation

struct TaskModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isChecked: Bool
}
