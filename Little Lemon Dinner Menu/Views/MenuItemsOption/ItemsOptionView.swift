//
//  ItemsOptionView.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 29/11/24.
//

import SwiftUI

struct SelectedMenuCategory: Identifiable {
    var id = UUID()
    var menuCategory = MenuCategory.Food
    var isSelected = false
}

struct SelectedSortMethod: Equatable, Identifiable {
    var id = UUID()
    var method = MenuItemSortMethod.alphabet
    var isSelected = false
}

struct ItemsOptionView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    @State var test: Bool = true
    
    @State var selectedCategories: [SelectedMenuCategory] = []
    
    @State var sortMethods: [SelectedSortMethod] = []
        
    var body: some View {

        NavigationView{
            List() {
                ForEach(OptinoItem.allCases, id: \.self) { optionItem in

                    Section(header: Text(optionItem.rawValue)) {
                        switch optionItem {
                        case .categories :
                            ForEach($selectedCategories) { $category in
                                Toggle(category.menuCategory.rawValue, isOn: $category.isSelected)
                            }
                        case .sorting :
                            ForEach($sortMethods) { $sortMethod in
                                Toggle(sortMethod.method.rawValue, isOn: $sortMethod.isSelected)
                                    .onChange(of: sortMethod) {
                                        if sortMethod.isSelected {
                                            self.sortMethods = self.sortMethods.map({
                                                var item = $0
                                                item.isSelected = $0.id == sortMethod.id
                                                return item })

                                        }
                                    }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Filter")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // Apply filters
                                                
                        viewModel.setMenuCategoryFilter(selectedCategories: self.selectedCategories)
                        
                        let sortMethod = self.sortMethods.first {
                            $0.isSelected
                        }
                            
                        viewModel.setSortMethod(sortMethod: sortMethod?.method)
                        
                        dismiss()
                        
                    } label: {
                        Text("Done")
                    }
                }
            }
            .onAppear {
                MenuCategory.allCases.forEach({ item in
                    self.selectedCategories.append(SelectedMenuCategory(
                        menuCategory: item,
                        isSelected: viewModel.selectedMenuCategories.contains(item) ? true : false
                    ))
                })
                MenuItemSortMethod.allCases.forEach({ item in
                    var isSelected = false
                    if let selectedSortMethod = viewModel.selectedSortMethod {
                        if selectedSortMethod == item {
                            isSelected = true
                        }
                    }
                    self.sortMethods.append(SelectedSortMethod(
                        method: item,
                        isSelected: isSelected
                    ))
                })
                print(self.selectedCategories)
                print(self.sortMethods)
            }

        }
    }
}

#Preview {
    @Previewable @StateObject var viewModel: MenuViewViewModel = MenuViewViewModel()
    ItemsOptionView().environmentObject(viewModel)
}
