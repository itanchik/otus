//
//  ViewModelIndexes.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 10.03.2025.
//

import SwiftUI

class ViewModelIndexes: ObservableObject {
    @Published var selectedTabIndex: Tabs = .aboutAsanas
    @Published var selectedCellIndex: Int?
    
    func changeTab(newTab: Tabs) {
        selectedTabIndex = newTab
    }
}
