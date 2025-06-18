//
//  POPUserDefaultsManager.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 12.05.2025.
//

import Foundation
import Combine

private enum POPUserDefaultsKeys {
    static let favoritesKey = "favoritePopulationIDs"
    static let cacheKey = "cachedPOPData"
}

protocol POPUserDefaultsManagerProtocol: AnyObject {
    var favoriteIDsPublisher: Published<Set<UUID>>.Publisher { get }

    func saveFavorites()
    func getFavoriteIDs() -> Set<UUID>
    func addFavorite(id: UUID)
    func removeFavorite(id: UUID)
}

class POPUserDefaultsManager: ObservableObject, POPUserDefaultsManagerProtocol {
    @Published var favoriteIDs: Set<UUID> = []
    
    var favoriteIDsPublisher: Published<Set<UUID>>.Publisher { $favoriteIDs }

    
    init() {
        favoriteIDs = getFavoriteIDs()
    }
}

extension POPUserDefaultsManager {
    func saveFavorites() {
        if let data = try? JSONEncoder().encode(favoriteIDs) {
            UserDefaults.standard.set(data, forKey: POPUserDefaultsKeys.favoritesKey)
        }
    }
    
    func getFavoriteIDs() -> Set<UUID> {
        if let data = UserDefaults.standard.data(forKey: POPUserDefaultsKeys.favoritesKey),
           let ids = try? JSONDecoder().decode(Set<UUID>.self, from: data) {
            return ids
        }
        return []
    }
    
    func addFavorite(id: UUID) {
        favoriteIDs.insert(id)
        saveFavorites()
    }
    
    func removeFavorite(id: UUID) {
        favoriteIDs.remove(id)
        saveFavorites()
    }
}

extension POPUserDefaultsManager {
    func savePOPItems(_ items: [POPItem]) {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: POPUserDefaultsKeys.cacheKey)
        }
    }
    
    func loadPOPItems() -> [POPItem]? {
        guard let data = UserDefaults.standard.data(forKey: POPUserDefaultsKeys.cacheKey),
              let items = try? JSONDecoder().decode([POPItem].self, from: data) else {
            return nil
        }
        return items
    }
}
