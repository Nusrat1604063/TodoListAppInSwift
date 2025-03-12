//
//  Listview.swift
//  TodoList
//
//  Created by Tabassum Akter Nusrat on 4/1/25.
//

import SwiftUI

struct Listiview: View {
    @EnvironmentObject var listViewModel : ListviewModel
     
    var body: some View {
         ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    
             } else {
                 List{
                     ForEach(listViewModel.items){ item in
                      ListRowView(item: item)
                             .onTapGesture {
                                 withAnimation(.linear) {
                                     listViewModel.updateItem(item: item)
                                 }
                             }
                     }.onDelete(perform: listViewModel.deleteItem)
                         .onMove(perform: listViewModel.moveItem)
                 }
                 .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("To do List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddView())
            )
    }
    
}

#Preview {
    NavigationView {
        Listiview()
    }.environmentObject(ListviewModel())
}


