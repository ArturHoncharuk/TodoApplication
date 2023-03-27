//
//  NewTaskView.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 26/03/2023.
//

import SwiftUI

struct NewTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText : String = ""
    @State var alertTitle: String = ""
    @State var isAlertActive: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("New task...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightText))
                    .cornerRadius(14)
                
                Button(action: handlePushNewTask, label: {
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
        .alert(isPresented: $isAlertActive, content: getAlert)
    }
    func handlePushNewTask () {
        if textIsAppropritate() {
            listViewModel.pushItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropritate() -> Bool {
        if(textFieldText.count < 3) {
            alertTitle = "Item's must contain at least 3 characters ‼️"
            isAlertActive.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewTaskView()
        }
        .environmentObject(ListViewModel())
    }
}
