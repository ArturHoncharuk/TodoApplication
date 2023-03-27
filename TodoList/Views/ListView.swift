//
//  ListView.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 26/03/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModal: ListViewModel
   
    var body: some View {
        List {
            ForEach(listViewModal.items) {
                item in ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModal.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModal.deleteItem)
            .onMove(perform: listViewModal.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: NewTaskView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
