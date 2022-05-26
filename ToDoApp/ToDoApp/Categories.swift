//
//  Task.swift
//  ToDoApp
//
//  Created by Maciej Malec on 25/05/2022.
//

import Foundation

enum Categories: String{
    case general, work, groceries, chores, finances
    
    var colour : Int {
        switch self {
        case .general : return 0
        case .work: return 1
        case .groceries: return 2
        case .chores: return 3
        case .finances: return 4
        }
    }
}
