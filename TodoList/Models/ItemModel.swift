//
//  ItemModel.swift
//  TodoList
//
//  Created by Tabassum Akter Nusrat on 19/2/25.
//

import Foundation
//immutable struct
struct itemModel : Identifiable, Codable {//if we want to use i†emMode in forEach loop it is better to make it identifiable
    let id:String   //UUIUD will create random string
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> itemModel {
        return itemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}


 
