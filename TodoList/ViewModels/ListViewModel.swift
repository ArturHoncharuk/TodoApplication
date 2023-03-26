//
//  ListViewModel.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 26/03/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [TaskModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            TaskModel(title: "First task", isChecked: false),
            TaskModel(title: "Second task", isChecked: true),
            TaskModel(title: "Third task", isChecked: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}
