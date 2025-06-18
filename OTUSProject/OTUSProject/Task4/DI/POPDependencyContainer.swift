//
//  POPDependencyContainer.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 15.05.2025.
//

import Foundation
import SwiftUI

class POPDependencyContainer: ObservableObject {
    let popDataLoader: POPDataLoader
    let userDefaultsManager: POPUserDefaultsManagerProtocol
    
    init() {
        self.popDataLoader = POPDataLoader(api: POPApi())
        self.userDefaultsManager = POPUserDefaultsManager()
    }
}
