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
    
    @State var presentOption = false
    @State var presentDetail = false
    @State var menuItem: MenuItem? = nil
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(MenuCategory.allCases, id: \.self  ) { category in
                    if viewModel.selectedMenuCategories.contains(category) {
                        Section(header: Text(category.rawValue)) {
                            VStack(alignment: .leading) {
                                ForEach(Array(viewModel.getMenuItemsByCategory(category: category).enumerated()), id: \.offset) { index, rowItems in
                                    HStack {
                                        ForEach(rowItems) { item in
                                            ItemView(item: item)
                                                .environmentObject(settings)
                                                .onTapGesture(perform: {
                                                    self.menuItem = item
                                                    self.presentDetail.toggle()
                                                })
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.presentOption.toggle()
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            .sheet(isPresented: $presentOption, content: {
                ItemsOptionView()
                    .environmentObject(viewModel)
                    .transition(.slide)
                    .navigationBarBackButtonHidden()
            })
            .navigationDestination(isPresented: $presentDetail, destination: {
                EmptyView()
            })

        }
    }
}

#Preview {
    @Previewable @StateObject var settings: GlobalSettings = GlobalSettings.shared
    MenuItemsView().environmentObject(settings)
}
