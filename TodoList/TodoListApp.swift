//
//  TodoListApp.swift
//  TodoList
//
//  Created by Tabassum Akter Nusrat on 4/1/25.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model  - data point
 View -  UI
 Viewmodel - manages Models for View
 
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListviewModel = ListviewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Listiview()
            }
            .environmentObject(listViewModel)   //Passing viewmodels as environment variable so that all                                                       //the view within the navigationview have acccess to the viewmodles
        }
    }
}
