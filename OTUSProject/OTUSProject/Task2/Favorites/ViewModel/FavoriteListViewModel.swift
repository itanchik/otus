//
//  FavoriteListViewModel.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 15.05.2025.
//

import Foundation
import Combine
import SwiftUI

class FavoriteListViewModel: ObservableObject {
    @ObservedObject var dataLoader: DataLoader
    @Published var favorites: [Product] = []
    @Published var favoriteIds: Set<Int> = []
    
    private var userDefaultsManager: UserDefaultsManagerProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(
        dataLoader: DataLoader,
        userDefaultsManager: UserDefaultsManagerProtocol
    ) {
        self.dataLoader = dataLoader
        self.userDefaultsManager = userDefaultsManager
        
        userDefaultsManager.favoriteIDsPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newIDs in
                guard let self = self else { return }
                self.favoriteIds = newIDs
                self.updateFavorites()
            }
            .store(in: &cancellables)
        
        dataLoader.loadedProductListPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.updateFavorites()
            }
            .store(in: &cancellables)
    }
    
    private func updateFavorites() {
        favorites = dataLoader.loadedProductList.filter { product in
            favoriteIds.contains(product.id)
        }
    }
}
