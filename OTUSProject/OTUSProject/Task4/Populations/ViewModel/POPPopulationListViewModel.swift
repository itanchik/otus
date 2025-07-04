//
//  POPPopulationListViewModel.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 16.05.2025.
//

import SwiftUI
import Combine

class POPPopulationListViewModel: ObservableObject {
    @ObservedObject var popDataLoader: POPDataLoader
    @Published var favoriteIDs: Set<UUID> = []
    @Published var populationList: [POPItem] = []
    @Published var isLoading: Bool = false
    
    private let userDefaultsManager: POPUserDefaultsManagerProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(
        popDataLoader: POPDataLoader,
        userDefaultsManager: POPUserDefaultsManagerProtocol
    ) {
        self.popDataLoader = popDataLoader
        self.userDefaultsManager = userDefaultsManager
        self.favoriteIDs = userDefaultsManager.getFavoriteIDs()
        
        popDataLoader.loadedPopulationListPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$populationList)
        
        popDataLoader.isLoadingPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: &$isLoading)
    }

    func toggleFavorite(for item: UUID) {
        if favoriteIDs.contains(item) {
            userDefaultsManager.removeFavorite(id: item)
        } else {
            userDefaultsManager.addFavorite(id: item)
        }
        userDefaultsManager.saveFavorites()
        favoriteIDs = userDefaultsManager.getFavoriteIDs()
    }
}
