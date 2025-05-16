//
//  ItemModel.swift
//  TodoListApp
//
//  Created by Gamze Akyüz on 4.05.2025.
//

import SwiftUI

//Immutable Struct
struct ItemModel: Identifiable, Codable{
    
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
