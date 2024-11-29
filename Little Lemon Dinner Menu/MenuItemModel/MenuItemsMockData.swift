//
//  MenuItemsMockData.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 29/11/24.
//

import Foundation

//struct MockMenuItem: MenuItemProtocol {
//    var price: Double = 0.0
//    
//    var title: String
//    
//    var category: MenuCategory
//    
//    var ordes: Int = 0
//    
//    var priceVarInt: Int = 0
//    
//    var id  = UUID()
//    
//    var ingredient: [Ingredient]
//}

struct MenuItemsMockData {
    var mockMenuItems: [MenuItem] {
        get {
            mockMenuItemsGenerator()
        }
    }
    
    private func mockMenuItemsGenerator() -> [MenuItem] {
        var result: [MenuItem] = []
        for type in MenuCategory.allCases {
            result.append(contentsOf: mockMenuItemsCategorytGenerator(itemsCount: mockMenuItemsCountByCategoryType(type: type), category: type))
        }
        return result
    }

    private func mockMenuItemsCountByCategoryType(type: MenuCategory) -> Int {
        return switch type {
        case .Food:
            12
        case .Drink:
            8
        case .Desert:
            4
        }
    }
    
    private func mockMenuItemsCategorytGenerator(itemsCount: Int, category: MenuCategory) -> [MenuItem]  {
        var result: [MenuItem] = []
        for i in 1...itemsCount {
            result.append(MenuItem(
                price: Double.random(in: 0...1000),
                title: category.rawValue + String(i),
                category: category,
                ordes: 0,
                ingredient: mockMenuIngredientsGenerator()
            ))
        }
        return result
    }

    private func mockMenuIngredientsGenerator() -> [Ingredient] {
        var result: [Ingredient] = []
        let ingredientsCount = Int.random(in: 0..<Ingredient.allCases.count)

        for _ in 0...ingredientsCount {
            result.append(Ingredient.allCases.randomElement()!)
        }
        return result
        
    }
    
}



