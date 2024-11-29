//
//  Little_Lemon_Dinner_MenuTests.swift
//  Little Lemon Dinner MenuTests
//
//  Created by R.A. on 28/11/24.
//

import XCTest
@testable import Little_Lemon_Dinner_Menu

final class Little_Lemon_Dinner_MenuTests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func test_mock_data_model() throws {
        let testMockData = MenuItemsMockData()
        XCTAssert(testMockData.mockMenuItems.count == 24)
                
        let testMockDataByFoodCategory = testMockData.mockMenuItems.filter { $0.category == MenuCategory.Food }
        
        XCTAssert(testMockDataByFoodCategory.count == 12)
        
        let testMockDataByDrinkCategory = testMockData.mockMenuItems.filter { $0.category == MenuCategory.Drink }
        
        XCTAssert(testMockDataByDrinkCategory.count == 8)
        
        let testMockDataByDessertCategory = testMockData.mockMenuItems.filter { $0.category == MenuCategory.Dessert }
        
        XCTAssert(testMockDataByDessertCategory.count == 4)
        
        let item = testMockData.mockMenuItems.first!
        
        let classItem = MenuItem(price: item.price, title: item.title, category: item.category, ordes: item.orders, ingredient: item.ingredient)

        XCTAssert(type(of: item) == type(of: classItem))
    }
    
    func test_viewModel_initialisation_and_loadingData() throws {
        let viewModel = MenuViewViewModel()
        
        XCTAssert(viewModel.menuitems.count == 24)
        
        viewModel.loadMenuItems()
        
        XCTAssert(viewModel.menuitems.count == 24)
        
    }
    
    
    func test_viewModel_select_menuItems_by_category() throws {
        let viewModel = MenuViewViewModel()
        
        let settings = GlobalSettings.shared
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.width
        let chunkedNumber = Int(screenWidth / settings.itemViewSize.width)
                
        let foodMenuItems = viewModel.menuitems.filter { $0.category == MenuCategory.Food}.chunked(into: chunkedNumber)

        
        let foods = viewModel.selectMenuItemsByCategory(category: .Food)
        
        XCTAssert(foodMenuItems.count == foods.count)
        
        XCTAssert(foods.first?.count == chunkedNumber)
    }
    
    func test_viewModel_sorting_by_Most_Popular () throws {
        let viewModel = MenuViewViewModel()
        
        viewModel.sortMenuItems(sortMethod: .popular)
        
        let foods = viewModel.selectMenuItemsByCategory(category: .Food)
        
        let firsFoodElementIndex = (0, 0)
        let lastFoodElementIndex = (foods.count - 1, foods[foods.count-1].count - 1)
        
        let firstFoodElement = foods[firsFoodElementIndex.0][firsFoodElementIndex.1]
        let lastFoodElement = foods[lastFoodElementIndex.0][lastFoodElementIndex.1]
                
        XCTAssert( firstFoodElement.orders >= lastFoodElement.orders )
        
        let drinks = viewModel.selectMenuItemsByCategory(category: .Drink)
        
        let firsDrinkElementIndex = (0, 0)
        let lastDrinkElementIndex = (drinks.count - 1, drinks[drinks.count-1].count - 1)
        
        let firstDrinkElement = drinks[firsDrinkElementIndex.0][firsDrinkElementIndex.1]
        let lastDrinkElement = drinks[lastDrinkElementIndex.0][lastDrinkElementIndex.1]
        
        XCTAssert( firstDrinkElement.orders >= lastDrinkElement.orders )
        
        let desserts = viewModel.selectMenuItemsByCategory(category: .Food)
        
        let firsDesertElementIndex = (0, 0)
        let lastDesertElementIndex = (desserts.count - 1, desserts[desserts.count-1].count - 1)
        
        let firstDesertElement = desserts[firsDesertElementIndex.0][firsDesertElementIndex.1]
        let lastDesertElement = desserts[lastDesertElementIndex.0][lastDesertElementIndex.1]
        
        XCTAssert( firstDesertElement.orders >= lastDesertElement.orders )
        

    }
    
    func test_viewModel_sorting_by_Price_$_$$$ () throws {
        let viewModel = MenuViewViewModel()
        
        viewModel.sortMenuItems(sortMethod: .price)
        
        let foods = viewModel.selectMenuItemsByCategory(category: .Food)
        
        let firsFoodElementIndex = (0, 0)
        let lastFoodElementIndex = (foods.count - 1, foods[foods.count-1].count - 1)
        
        let firstFoodElement = foods[firsFoodElementIndex.0][firsFoodElementIndex.1]
        let lastFoodElement = foods[lastFoodElementIndex.0][lastFoodElementIndex.1]
        
        XCTAssert( firstFoodElement.price <= lastFoodElement.price )
        
        let drinks = viewModel.selectMenuItemsByCategory(category: .Drink)
        
        let firsDrinkElementIndex = (0, 0)
        let lastDrinkElementIndex = (drinks.count - 1, drinks[drinks.count-1].count - 1)
        
        let firstDrinkElement = drinks[firsDrinkElementIndex.0][firsDrinkElementIndex.1]
        let lastDrinkElement = drinks[lastDrinkElementIndex.0][lastDrinkElementIndex.1]
        
        XCTAssert( firstDrinkElement.price <= lastDrinkElement.price )
        
        let desserts = viewModel.selectMenuItemsByCategory(category: .Food)
        
        let firsDesertElementIndex = (0, 0)
        let lastDesertElementIndex = (desserts.count - 1, desserts[desserts.count-1].count - 1)
        
        let firstDesertElement = desserts[firsDesertElementIndex.0][firsDesertElementIndex.1]
        let lastDesertElement = desserts[lastDesertElementIndex.0][lastDesertElementIndex.1]
        
        XCTAssert( firstDesertElement.price <= lastDesertElement.price )

    }
    
    func test_viewModel_sorting_by_A_Z () throws {
        let viewModel = MenuViewViewModel()
        
        viewModel.sortMenuItems(sortMethod: .alphabet)
        
        let foods = viewModel.selectMenuItemsByCategory(category: .Food)
        
        let firsFoodElementIndex = (0, 0)
        let lastFoodElementIndex = (foods.count - 1, foods[foods.count-1].count - 1)
        
        let firstFoodElement = foods[firsFoodElementIndex.0][firsFoodElementIndex.1]
        let lastFoodElement = foods[lastFoodElementIndex.0][lastFoodElementIndex.1]
        
        XCTAssert( firstFoodElement.title <= lastFoodElement.title )
        
        let drinks = viewModel.selectMenuItemsByCategory(category: .Drink)
        
        let firsDrinkElementIndex = (0, 0)
        let lastDrinkElementIndex = (drinks.count - 1, drinks[drinks.count-1].count - 1)
        
        let firstDrinkElement = drinks[firsDrinkElementIndex.0][firsDrinkElementIndex.1]
        let lastDrinkElement = drinks[lastDrinkElementIndex.0][lastDrinkElementIndex.1]
        
        XCTAssert( firstDrinkElement.title <= lastDrinkElement.title )
        
        let desserts = viewModel.selectMenuItemsByCategory(category: .Food)
        
        let firsDesertElementIndex = (0, 0)
        let lastDesertElementIndex = (desserts.count - 1, desserts[desserts.count-1].count - 1)
        
        let firstDesertElement = desserts[firsDesertElementIndex.0][firsDesertElementIndex.1]
        let lastDesertElement = desserts[lastDesertElementIndex.0][lastDesertElementIndex.1]
        
        XCTAssert( firstDesertElement.title <= lastDesertElement.title )

    }

}
