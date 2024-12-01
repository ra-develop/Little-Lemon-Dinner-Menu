//
//  MenuViewViewModel.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 29/11/24.
//

import Foundation
import UIKit
import SwiftUI

class MenuViewViewModel: ObservableObject {
    
    private let settings = GlobalSettings.shared
    private var foodMenuItems: [MenuItem] = []
    private var drinkMenyItems: [MenuItem] = []
    private var dessertMenuItems: [MenuItem] = []
    
    private var chunkedNumber: Int = 1
    
    private var menuitems: [MenuItem] = []
    
    @Published private(set) var selectedMenuCategories: [MenuCategory] = [.Food, .Drink, .Dessert]
    @Published private(set) var selectedSortMethod: MenuItemSortMethod? =  nil
    
    init() {
        print("ViewModel started")
        loadMenuItems()
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.width
        chunkedNumber = Int(screenWidth / settings.itemViewSize.width)
    }
    
    func loadMenuItems() {
        self.menuitems = MenuItemsMockData().mockMenuItems // Load mock data
        self.foodMenuItems = self.menuitems.filter { $0.category == MenuCategory.Food}
        self.drinkMenyItems = self.menuitems.filter {$0.category == MenuCategory.Drink}
        self.dessertMenuItems = self.menuitems.filter {$0.category == MenuCategory.Dessert}
    }
    
    func getMenuItemsByCategory(category: MenuCategory) -> [[MenuItem]]  {
        var selectedMenuItems: [MenuItem] = []
        switch category {
        case .Food:
            selectedMenuItems = self.foodMenuItems
        case .Drink:
            selectedMenuItems = self.drinkMenyItems
        case .Dessert:
            selectedMenuItems = self.dessertMenuItems
        }
        return selectedMenuItems.chunked(into: chunkedNumber)
    }

    
    func setMenuCategoryFilter(selectedCategories: [SelectedMenuCategory]) {
        self.selectedMenuCategories = selectedCategories.compactMap {
            if $0.isSelected {
                return $0.menuCategory
            }
            return nil
        }
    }
    
    func setSortMethod(sortMethod: MenuItemSortMethod?) {
        self.selectedSortMethod = sortMethod
        switch sortMethod {
        case .popular:
            self.foodMenuItems.sort { $0.orders > $1.orders }
            self.drinkMenyItems.sort { $0.orders > $1.orders }
            self.dessertMenuItems.sort { $0.orders > $1.orders }
        case .price:
            self.foodMenuItems.sort { $0.price < $1.price }
            self.drinkMenyItems.sort { $0.price < $1.price }
            self.dessertMenuItems.sort { $0.price < $1.price }
        case .alphabet:
            self.foodMenuItems.sort { $0.title < $1.title }
            self.drinkMenyItems.sort { $0.title < $1.title }
            self.dessertMenuItems.sort { $0.title < $1.title }
        case .none:
            self.foodMenuItems.shuffle()
            self.drinkMenyItems.shuffle()
            self.dessertMenuItems.shuffle()
        }
    }
    
}
