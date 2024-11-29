//
//  ItemView.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 29/11/24.
//

import SwiftUI

struct ItemView: View {
    @State var item: MenuItem
    @EnvironmentObject var settings: GlobalSettings
    
    var body: some View {
        VStack {
            Color.black.frame(width: settings.itemViewSize.width, height: settings.itemViewSize.height, alignment: .center)
            Text(item.title)
        }
    }
}

#Preview {
    @Previewable @StateObject var settings: GlobalSettings = GlobalSettings.shared
    ItemView(item: MenuItemsMockData().mockMenuItems.first!).environmentObject(settings)
}
