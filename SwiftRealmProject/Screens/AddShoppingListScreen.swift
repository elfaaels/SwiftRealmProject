//
//  AddShoppingListScreen.swift
//  SwiftRealmProject
//
//  Created by Elfana Anamta Chatya on 31/08/23.
//

import SwiftUI
import RealmSwift

struct AddShoppingListScreen: View {
    
    @State private var title: String = ""
    @State private var address: String = ""
    
    @ObservedResults(ShoppingList.self) var shoppingLists
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationView {
            
            Form {
                TextField("Enter Title", text: $title)
                TextField("Enter Address", text: $address)
                
                Button {
                   // Create a shopping list
                    let shoppingList = ShoppingList()
                    shoppingList.title = title
                    shoppingList.address = address
                    $shoppingLists.append(shoppingList)
                   
                    dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }.buttonStyle(.bordered)

            }
            
            .navigationTitle("New List")
        }
    }
}

struct AddShoppingListScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingListScreen()
    }
}
