//
//  ListView.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 26/03/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [TaskModel] = [
        TaskModel(title: "First task", isChecked: false),
        TaskModel(title: "Second task", isChecked: true),
        TaskModel(title: "Third task", isChecked: false),
    ]
    
    var body: some View {
        List {
            ForEach(items) {
                item in ListRowView(item: item)
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: NewTaskView())
        )
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
