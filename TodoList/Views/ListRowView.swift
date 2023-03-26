//
//  ListRowView.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 26/03/2023.
//

import SwiftUI

struct ListRowView: View {
    let item: TaskModel
    var body: some View {
        HStack {
            Image(systemName: item.isChecked ? "checkmark.circle" : "circle")
                .foregroundColor(item.isChecked ? .green : .red)
            Text(item.title)
                Spacer()
        
        }
        .font(.title2)
        .padding(.vertical, 8)
        
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var firstItem = TaskModel(title: "First item", isChecked: false)
    static var secondItem = TaskModel(title: "Second item", isChecked: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: firstItem)
            ListRowView(item: secondItem)
        }
        .previewLayout(.sizeThatFits)
    }
}
