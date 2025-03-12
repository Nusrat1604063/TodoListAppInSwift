//
//  ListViewModel.swift
//  TodoList
//
//  Created by Tabassum Akter Nusrat on 19/2/25.
//

import Foundation

/*
 CRUD functions
 Create
 Read
 Update
 delete
 */
class ListviewModel : ObservableObject{
    @Published var items:[itemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itmesKey : String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        //        let newItems = [
        //            itemModel(title: "Buy Milk", isCompleted: false),
        //            itemModel(title: "Buy Bread", isCompleted: true),
        //            itemModel(title: "Learn Swift", isCompleted: false)
        //        ]
        //        items.append(contentsOf: newItems)
        
        guard let data = UserDefaults.standard.data(forKey: itmesKey) else {return}
        guard let savedItems = try? JSONDecoder().decode([itemModel].self, from: data) else {return}
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
        
        func moveItem(from:IndexSet, to:Int) {
            items.move(fromOffsets: from, toOffset: to)
        }
        
        func addItem(title:String){
            let newItem = itemModel(title: title, isCompleted: false)
            items.append(newItem)
        }
        
        func updateItem(item: itemModel) {
            if let index = items.firstIndex(where: { $0.id == item.id }) {
                items[index] = item.updateCompletion()
            }
            
        }
        
        func saveItems() {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: itmesKey)
            }
        }
   
}
