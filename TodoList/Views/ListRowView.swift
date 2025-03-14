//
//  ListRowView.swift
//  TodoList
//
//  Created by Tabassum Akter Nusrat on 19/2/25.
//

import SwiftUI

struct ListRowView : View {
    
    let item:itemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green:.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct ListRowView_Previews : PreviewProvider {
    static var item1 = itemModel(title: "first item", isCompleted: false)
    static var item2 = itemModel(title: "second item", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
