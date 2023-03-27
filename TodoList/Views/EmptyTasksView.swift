//
//  EmptyTasksView.swift
//  TodoList
//
//  Created by Arthur Honcharuk on 27/03/2023.
//

import SwiftUI

struct EmptyTasksView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                Text("There are no tasks!")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Are you a productive? Let's create a new task")
                    .padding(.bottom, 32)
                 NavigationLink(
                    destination: NewTaskView(),
                    label: {
                        Text("Let's create your first task")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.accentColor : Color.gray)
                            .cornerRadius(14)
                            .padding(.horizontal, 24)
                        
                    })
                 .padding(.horizontal, animate ? 12 : 48)
                 .shadow(color: animate ? Color.accentColor.opacity(0.3) : Color.gray.opacity(0.3),
                         radius: animate ? 30 : 10,
                         x: 0,
                         y: animate ? 0.7 : 0)
                 .scaleEffect(animate ? 1.1 : 1)
            }
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct EmptyTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyTasksView()
                .navigationTitle("Empty tasks")
        }
    }
}
