//
//  DependencyContainer.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 15.05.2025.
//

import Foundation
import SwiftUI

class DependencyContainer: ObservableObject {
    let dataLoader: DataLoader
    let userDefaultsManager: UserDefaultsManagerProtocol
    
    init() {
        self.dataLoader = DataLoader(api: MakeAppApi())
        self.userDefaultsManager = UserDefaultsManager()
    }
}
