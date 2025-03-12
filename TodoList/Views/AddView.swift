//
//  AddView.swift
//  TodoList
//
//  Created by Tabassum Akter Nusrat on 19/2/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListviewModel
    @State var textFieldtext: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
       ScrollView {
           VStack {
               TextField("Type something here..", text:$textFieldtext)
                   .padding(.horizontal)
                   .frame(height:55)
                   .background(Color(UIColor.secondarySystemBackground))
                   .cornerRadius(10)
                  
               Button(action: addButtonPressed, label: {
                   Text("Save".uppercased())
                       .foregroundColor(Color.white)
                       .font(.headline)
                       .frame(height: 55)
                       .frame(maxWidth: .infinity)
                       .background(Color.blue)
                       .cornerRadius(10)
               })
                    
           }
           .padding(14 )
       }
       .navigationTitle("Add an item 🖊️")
       .alert(isPresented: $showAlert, content: getAlert) 
    }
    
    func addButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldtext)
            presentationMode.wrappedValue.dismiss()   //It tells to go back to Screen/view in a hierarchy
        }
       
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldtext.count < 3 {
            alertTitle = "Your next to do item must be at least 3 characters long!!!🤨"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title:Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }.environmentObject(ListviewModel())
    }
}
