//
//  MenuItem.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 29/11/24.
//

import Foundation

struct MenuItem: Identifiable {
    var id = UUID()
    
    let titile: String
    let ingredient: [Ingredient]
}
