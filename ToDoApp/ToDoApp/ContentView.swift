//
//  ContentView.swift
//  ToDoApp
//
//  Created by Maciej Malec on 25/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        VStack{
            Text("ToDo App")
            List {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
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
