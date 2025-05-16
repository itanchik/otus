//
//  ProductListViewModel.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 16.05.2025.
//

import SwiftUI
import Combine

class ProductListViewModel: ObservableObject {
    @ObservedObject var dataLoader: DataLoader
    @Published var favoriteIDs: Set<Int> = []
    @Published var productList: [Product] = []
    
    private let userDefaultsManager: UserDefaultsManagerProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(
        dataLoader: DataLoader,
        userDefaultsManager: UserDefaultsManagerProtocol
    ) {
        self.dataLoader = dataLoader
        self.userDefaultsManager = userDefaultsManager
        self.favoriteIDs = userDefaultsManager.getFavoriteIDs()
        
        dataLoader.loadedProductListPublisher
                .receive(on: DispatchQueue.main)
                .sink { [weak self] products in
                    self?.productList = products
                }
                .store(in: &cancellables)
    }
    
    func toggleFavorite(for product: Product) {
        if favoriteIDs.contains(product.id) {
            userDefaultsManager.removeFavorite(id: product.id)
        } else {
            userDefaultsManager.addFavorite(id: product.id)
        }
        userDefaultsManager.saveFavorites()
        favoriteIDs = userDefaultsManager.getFavoriteIDs()
    }
}
