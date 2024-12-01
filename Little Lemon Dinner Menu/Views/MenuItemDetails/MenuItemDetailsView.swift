//
//  MenuItemDetailsView.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 01/12/24.
//

import SwiftUI

struct MenuItemDetailsView: View {
    var menuItem: MenuItem
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    Image("LittleLemonLogo").resizable().scaledToFit().padding([.leading, .trailing], 70)
                    Spacer()
                    Text("Price:").bold()
                    Text(String(format: "%.2f", menuItem.price))
                    Spacer()
                    Text("Ordered:").bold()
                    Text(String(menuItem.orders))
                    Spacer()
                    Text("Ingredients:").bold()
                    VStack {
                        ForEach(Array(menuItem.ingredient), id: \.self) {ingredient in
                            Text(ingredient.rawValue)
                        }
                        
                    }
                }
            }
            .navigationTitle(self.menuItem.title)

        }
    }
}

#Preview {
    var menuItem: MenuItem? = MenuItemsMockData().mockMenuItems.first
    MenuItemDetailsView(menuItem: menuItem!)
}
