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
    var orders: Int { set get }
    var priceVarInt: Int { set get }
    var ingredient: [Ingredient] { set get }
}

class MenuItem: MenuItemProtocol, Identifiable {
    var id: UUID = UUID()
    
    var price: Double
    
    var title: String
    
    var category: MenuCategory
    
    var orders: Int
    
    var priceVarInt: Int = 0
    
    var ingredient: [Ingredient]
    
    init(price: Double, title: String, category: MenuCategory, ordes: Int, ingredient: [Ingredient]) {
        self.price = price
        self.title = title
        self.category = category
        self.orders = ordes
        self.ingredient = ingredient
    }
}
