//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by Maciej Malec on 25/05/2022.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    private var alertMessages = ["Task can not be blank!", "Deadline can not be in the past!", "Error when adding a new task, try again!", "Task successfully added!"]
    @State var alertMsg = 0
    
    
    @State private var date = Date.now
    @State private var category = Categories.general
    @State private var task = ""
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Deadline & Category")){
                    DatePicker("Choose a deadline:", selection: $date, displayedComponents: .date)
                    HStack{
                        Text("Pick a category:")
                        Spacer()
                        Picker("", selection: $category) {
                            Text("General").tag(Categories.general)
                            Text("Work").tag(Categories.work)
                            Text("Groceries").tag(Categories.groceries)
                            Text("Chores").tag(Categories.chores)
                            Text("Finances").tag(Categories.finances)
                            
                        }.pickerStyle(.menu)
                    }
                }
                Section(header: Text("Task")){
                    TextField("Enter the task", text: $task)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }
            }
            HStack{
                Spacer()
                Button("Cancel") {
                    dismiss()
                }.padding()
                Spacer()
                Button("Add") {
                    create()
                }.padding()
                .alert(alertMessages[alertMsg], isPresented: $showingAlert) {
                    Button("Ok", role: .cancel) {
                        if alertMsg == 3 {
                            dismiss()
                        }
                    }
                }
                Spacer()
            }
        }
    }
    
    private func create(){
        if inputCheck() {
            //add to core data
            let todo = Todo(context: moc)
            todo.id = UUID()
            todo.date = date
            todo.category = category.rawValue
            todo.task = task
            
            do {
                try self.moc.save()
                alertMsg = 3
                showingAlert = true
            } catch {
                //error occured
                alertMsg = 2
                showingAlert = true
            }
        }else{
            //show error
            showingAlert = true
        }
    }
    
    private func inputCheck() -> Bool{
        if task == "" {
            alertMsg = 0
            return false
        }
        if date < Date() {
            alertMsg = 1
            return false
        }
        return true
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
