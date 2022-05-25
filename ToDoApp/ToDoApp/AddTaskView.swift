//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by Maciej Malec on 25/05/2022.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var date = Date.now
    @State private var category = 1
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Title")){
                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                Section(header: Text("Deadline & Category")){
                    DatePicker("Choose a deadline:", selection: $date, displayedComponents: .date)
                    HStack{
                        Text("Pick a category:")
                        Spacer()
                        Picker("", selection: $category) {
                            Text("C1").tag(1)
                            Text("C2").tag(2)
                            
                        }.pickerStyle(.menu)
                    }
                }
                Section(header: Text("Task")){
                    TextEditor(text: /*@START_MENU_TOKEN@*/.constant("Placeholder")/*@END_MENU_TOKEN@*/)
                }
            }
            HStack{
                Spacer()
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Button("Add") {
                    //add to core data
                    
                    dismiss()
                }
                Spacer()
            }
        }
        
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
