//
//  MenuItem.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 29/11/24.
//

import Foundation


protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var category: MenuCategory { get }
    var ordes: Int { set get }
    var priceVarInt: Int { set get }
    var ingredient: [Ingredient] { set get }
}

class MenuItem: MenuItemProtocol {
    var id: UUID = UUID()
    
    var price: Double
    
    var title: String
    
    var category: MenuCategory
    
    var ordes: Int
    
    var priceVarInt: Int
    
    var ingredient: [Ingredient]
    
    init(id: UUID, price: Double, title: String, category: MenuCategory, ordes: Int, priceVarInt: Int, ingredient: [Ingredient]) {
        self.price = price
        self.title = title
        self.category = category
        self.ordes = ordes
        self.priceVarInt = priceVarInt
        self.ingredient = ingredient
    }
}
