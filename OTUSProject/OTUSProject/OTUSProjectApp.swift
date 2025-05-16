//
//  OTUSProjectApp.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 05.03.2025.
//

import SwiftUI

@main
struct OTUSProjectApp: App {
    @StateObject private var appViewModel = AppViewModel(userDefaultsManager: UserDefaultsManager())
    @StateObject private var container = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appViewModel)
                .environmentObject(container)
        }
    }
}
