//
//  POPFavoriteListViewModel.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 15.05.2025.
//

import Foundation
import Combine
import SwiftUI

class POPFavoriteListViewModel: ObservableObject {
    @ObservedObject var popDataLoader: POPDataLoader
    @Published var favorites: [POPItem] = []
    @Published var favoriteIds: Set<UUID> = []
    
    private var userDefaultsManager: POPUserDefaultsManagerProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(
        popDataLoader: POPDataLoader,
        userDefaultsManager: POPUserDefaultsManagerProtocol
    ) {
        self.popDataLoader = popDataLoader
        self.userDefaultsManager = userDefaultsManager
        
        userDefaultsManager.favoriteIDsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newIDs in
                guard let self else { return }
                self.favoriteIds = newIDs
                self.updateFavorites()
            }
            .store(in: &cancellables)
        
        popDataLoader.loadedPopulationListPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                self.updateFavorites()
            }
            .store(in: &cancellables)
    }
    
    private func updateFavorites() {
        favorites = popDataLoader.loadedPopulationList.filter { item in
            favoriteIds.contains(item.id)
        }
    }
}
