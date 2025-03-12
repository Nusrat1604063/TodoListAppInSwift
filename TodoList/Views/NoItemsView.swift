//
//  NoItemsView.swift
//  TodoList
//
//  Created by Tabassum Akter Nusrat on 21/2/25.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var isanimate: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("No items to show")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your To do list!")
                NavigationLink(destination: AddView(), label: {
                    Text("Navigate to Add View🖊️")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .frame(width: .infinity)
                        .frame(height:55)
                        .background(isanimate ? Color.green : Color.blue)
                        .cornerRadius(10)
                })
                .padding(.horizontal, isanimate ? 30 : 50)
                    
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !isanimate else { return } //animate false hole nichergula execute hobe naile eikhan theke                             //chole jabe
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                isanimate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }

}
