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
    
    func pushItem(title: String) {
        let newItem = TaskModel(title: title, isChecked: false)
        items.append(newItem)
    }
    
    func updateItem(item: TaskModel) {
        
//        if let idx = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            // run this code
//        }
        
        if let idx = items.firstIndex(where: { $0.id == item.id }) {
            items[idx] = item.updateCompletion()
        }
    }
}
