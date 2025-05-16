//
//  UserDefaultsManager.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 12.05.2025.
//

import Foundation
import Combine

enum UserDefaultsKeys {
    static let isOnboardingShownKey = "isOnboardingShownKey"
    static let favoritesKey = "favoriteProductIDs"
}

protocol UserDefaultsManagerProtocol: AnyObject {
    var favoriteIDsPublisher: Published<Set<Int>>.Publisher { get }
    
    func saveIsOnboardingShown(_ shown: Bool)
    func getIsOnboardingShown() -> Bool
    
    func saveFavorites()
    func getFavoriteIDs() -> Set<Int>
    func addFavorite(id: Int)
    func removeFavorite(id: Int)
}

class UserDefaultsManager: ObservableObject, UserDefaultsManagerProtocol {
//    var favoriteIDsPublisher: Published<Set<Int>>.Publisher
    
    @Published var favoriteIDs: Set<Int> = []
    
    var favoriteIDsPublisher: Published<Set<Int>>.Publisher { $favoriteIDs }

    
    init() {
        favoriteIDs = getFavoriteIDs()
    }
}

extension UserDefaultsManager {
    func saveIsOnboardingShown(_ shown: Bool) {
        UserDefaults.standard.set(shown, forKey: UserDefaultsKeys.isOnboardingShownKey)
    }
    
    func getIsOnboardingShown() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isOnboardingShownKey)
    }
}

extension UserDefaultsManager {
    func saveFavorites() {
        if let data = try? JSONEncoder().encode(favoriteIDs) {
            UserDefaults.standard.set(data, forKey: UserDefaultsKeys.favoritesKey)
        }
    }
    
    func getFavoriteIDs() -> Set<Int> {
        if let data = UserDefaults.standard.data(forKey: UserDefaultsKeys.favoritesKey),
           let ids = try? JSONDecoder().decode(Set<Int>.self, from: data) {
            return ids
        }
        return []
    }
    
    func addFavorite(id: Int) {
        favoriteIDs.insert(id)
        saveFavorites()
    }
    
    func removeFavorite(id: Int) {
        favoriteIDs.remove(id)
        saveFavorites()
    }
}
