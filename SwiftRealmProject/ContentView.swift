//
//  ContentView.swift
//  SwiftRealmProject
//
//  Created by Elfana Anamta Chatya on 31/08/23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                if shoppingLists.isEmpty {
                    Text("No Shopping List")
                }
                
                List {
                    ForEach(shoppingLists, id: \.id) { shoppingLists in
                        
                        NavigationLink {
                            ShoppingListItemScreen(shoppingList: shoppingLists)

                        } label: {
                            VStack(alignment: .leading) {
                                Text(shoppingLists.title)
                                Text(shoppingLists.address)
                                    .opacity(0.4)
                            }

                        }

                        
                       
                    }.onDelete(perform: $shoppingLists.remove)
                }
                
                    .navigationTitle("iBuy App")
                   
                }
            .sheet(isPresented: $isPresented, content: {
                // Show Sheet View
                AddShoppingListScreen() 
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Action
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
