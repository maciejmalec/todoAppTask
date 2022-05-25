//
//  DataController.swift
//  ToDoApp
//
//  Created by Maciej Malec on 25/05/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Model")
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("error when loading: \(error.localizedDescription)")
            }
        }
    }
}
