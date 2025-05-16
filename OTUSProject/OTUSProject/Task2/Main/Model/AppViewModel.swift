//
//  AppViewModel.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 10.05.2025.
//

import Foundation

class AppViewModel: ObservableObject{
    @Published var selectedTab: TabType = .list
    @Published var showOnboarding: Bool
    
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    init(userDefaultsManager: UserDefaultsManagerProtocol) {
        self.userDefaultsManager = userDefaultsManager
        
        let isOnboardingShown = userDefaultsManager.getIsOnboardingShown()
        self.showOnboarding = !isOnboardingShown
    }
    
    func closeOnboarding(){
        showOnboarding = false
        userDefaultsManager.saveIsOnboardingShown(true)
    }
}
