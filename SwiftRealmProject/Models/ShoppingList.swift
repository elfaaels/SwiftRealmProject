//
//  ShoppingList.swift
//  SwiftRealmProject
//
//  Created by Elfana Anamta Chatya on 31/08/23.
//

import Foundation
import RealmSwift

class ShoppingList: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var address: String
    
    @Persisted var items: List<ShoppingItem> = List<ShoppingItem>()
    
    
    
    override class func primaryKey() -> String? {
        "id" 
    }
    
}
