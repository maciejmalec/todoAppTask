//
//  ContentView.swift
//  ToDoApp
//
//  Created by Maciej Malec on 25/05/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var todos: FetchedResults<Todo>
    @State private var showingSheet = false
    
    var body: some View {
        VStack{
            Text("ToDo App")
            if todos.count < 1 {
                Spacer()
                Text("No tasks have been created!")
                Spacer()
            }else{
                List(todos) { todo in
                    Text(todo.task ?? "Unknown")
                }
            }
            Button("Create new task") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                AddTaskView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
