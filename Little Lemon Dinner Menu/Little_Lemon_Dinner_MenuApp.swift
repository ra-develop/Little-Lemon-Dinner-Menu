//
//  Little_Lemon_Dinner_MenuApp.swift
//  Little Lemon Dinner Menu
//
//  Created by R.A. on 28/11/24.
//

import SwiftUI

@main
struct Little_Lemon_Dinner_MenuApp: App {
    @StateObject var settings = GlobalSettings.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settings)
        }
    }
}
