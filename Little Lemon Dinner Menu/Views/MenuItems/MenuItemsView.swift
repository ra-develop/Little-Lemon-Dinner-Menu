//
//  MenuItemsView.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 29/11/24.
//

import SwiftUI

struct MenuItemsView: View {
    @EnvironmentObject var settings: GlobalSettings
    
    @ObservedObject var viewModel : MenuViewViewModel = MenuViewViewModel()
        
    var body: some View {
        NavigationView {
            List {
                ForEach(MenuCategory.allCases, id: \.self  ) { category in
                    if category != .All {
                        Section(header: Text(category.rawValue)) {
                            Grid {
                                ForEach(Array(viewModel.selectMenuItemsByCategory(category: category).enumerated()), id: \.offset) { index, rowItems in
                                    GridRow {
                                        ForEach(rowItems) { item in
                                            ItemView(item: item).environmentObject(settings)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Call Option View

                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var settings: GlobalSettings = GlobalSettings.shared
    MenuItemsView().environmentObject(settings)
}
