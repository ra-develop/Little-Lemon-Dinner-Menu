//
//  MenuItemsMockData.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 29/11/24.
//

import Foundation

struct MenuItemsMockData {
    var mockMenuItems: [MenuItem] {
        get {
            mockMenuItemsGenerator()
        }
    }
    
    private func mockMenuItemsGenerator() -> [MenuItem] {
        var result: [MenuItem] = []
        for type in MenuCategory.allCases {
            result.append(contentsOf: mockMenuItemsCategorytGenerator(itemsCount: mockMenuItemsCountByCategoryType(type: type), type: type))
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
    
    private func mockMenuItemsCategorytGenerator(itemsCount: Int, type: MenuCategory) -> [MenuItem]  {
        var result: [MenuItem] = []
        for i in 1...itemsCount {
            result.append(MenuItem(
                titile: type.rawValue, ingredient: mockMenuIngredientsGenerator()
                
            ))
        }
        return result
    }

    private func mockMenuIngredientsGenerator() -> [Ingredient] {
        var result: [Ingredient] = []
        let ingredientsCount = Int.random(in: 0..<Ingredient.allCases.count)

        for i in 0...ingredientsCount {
            result.append(Ingredient.allCases.randomElement()!)
        }
        return result
        
    }
    
}



