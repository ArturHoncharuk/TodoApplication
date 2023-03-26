//
//  NewTaskView.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 26/03/2023.
//

import SwiftUI

struct NewTaskView: View {
    
    @State var textFieldText : String = ""
    
    func handlePushNewTask () {
        
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("New task...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightText))
                    .cornerRadius(14)
                
                Button(action: {
                    handlePushNewTask()
                }, label: {
                    Text("SAVE".uppercased())
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(14)
                })
            
            }
            .padding(14)
        }
        .navigationTitle("Add a new task 📝")
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewTaskView()
        }
    }
}
