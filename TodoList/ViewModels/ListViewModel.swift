//
//  ListViewModel.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 26/03/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [TaskModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let tasksKey: String = "tasks_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let savedItems = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        
        self.items = savedItems
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
        if let idx = items.firstIndex(where: { $0.id == item.id }) {
            items[idx] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
}
