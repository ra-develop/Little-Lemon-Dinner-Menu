//
//  ContentView.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: GlobalSettings

    var body: some View {
        MenuItemsView()
    }
}

#Preview {
    @Previewable @StateObject var settings: GlobalSettings = GlobalSettings.shared
    ContentView().environmentObject(settings)
}
