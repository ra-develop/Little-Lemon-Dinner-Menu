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
        for category in MenuCategory.allCases {
            result.append(contentsOf: mockMenuItemsCategorytGenerator(itemsCount: mockMenuItemsCountByCategoryType(category: category), category: category))
        }
        return result
    }

    private func mockMenuItemsCountByCategoryType(category: MenuCategory) -> Int {
        return switch category {
        case .Food:
            12
        case .Drink:
            8
        case .Dessert:
            4
        }
    }
    
    private func mockMenuItemsCategorytGenerator(itemsCount: Int, category: MenuCategory) -> [MenuItem]  {
        var result: [MenuItem] = []
        guard itemsCount != 0 else {
            return result
        }
        for i in 1...itemsCount {
            result.append(MenuItem(
                price: Double.random(in: 0...1000),
                title: category.rawValue + " " + convert(i, digitsNumber: 3),
                category: category,
                ordes: Int.random(in: 0...1000),
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
    
    private func convert(_ score: Int, digitsNumber: Int) -> String {
        let format = "%0\(digitsNumber)ld"
        return String(format: format, score)
    }
    
}



