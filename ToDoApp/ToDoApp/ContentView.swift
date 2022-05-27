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
    @State private var showingAlert = false
    @State private var offsets: IndexSet?
    
    var body: some View {
        VStack{
            Text("ToDo App")
            if todos.count < 1 {
                Spacer()
                Text("No tasks have been created!")
                Spacer()
            }else{
                List{
                    ForEach(todos){ todo in
                        VStack{
                            HStack{
                                Text(todo.date ?? Date(), style: .date)
                                Spacer()
                                Text(todo.category?.capitalized ?? "")
                            }
                            Divider()
                            Text(todo.task ?? "").frame(maxWidth: .infinity, alignment: .leading).fixedSize(horizontal: false, vertical: true)
                        }.listRowBackground(getColour(category: todo.category ?? ""))
                    }.onDelete(perform: getItemToDelete)
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Are you sure you want to delete this task?"),
                                primaryButton: .destructive(Text("Delete")) {
                                    delete()
                                },
                                secondaryButton: .cancel()
                            )
                        }
                }
            }
            Button("Create new task") {
                showingSheet.toggle()
            }.padding()
            .sheet(isPresented: $showingSheet) {
                AddTaskView()
            }
        }
    }
    
    func delete(){
                for index in offsets! {
                    let task = todos[index]
                    moc.delete(task)
                }
        
                do {
                    try moc.save()
                } catch {
        
                }
    }
    
    func getItemToDelete(at offsets: IndexSet) {
        self.offsets = offsets
        showingAlert = true
    }
    
    private func getColour(category: String) -> Color{
        switch category {
        case "general":
            return Color.blue
        case "work":
            return Color.mint
        case "finances":
            return Color.green
        case "groceries":
            return Color.yellow
        case "chores":
            return Color.gray
        default:
            return Color.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
