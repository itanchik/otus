//
//  POPFavoriteListView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import SwiftUI

struct POPFavoriteListView: View {
    @StateObject private var viewModel: POPFavoriteListViewModel
    
    init(
        popDataLoader: POPDataLoader,
        userDefaultsManager: POPUserDefaultsManagerProtocol
    ) {
        _viewModel = StateObject(wrappedValue: POPFavoriteListViewModel(
            popDataLoader: popDataLoader,
            userDefaultsManager: userDefaultsManager
        ))
    }
    
    var body: some View {
        Group {
            if viewModel.favorites.isEmpty {
                Text("No Favorites")
            } else {
                List {
                    ForEach(viewModel.favorites) { item in
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Year:")
                                        .bold()
                                    Text(item.year)
                                }
                                
                                HStack {
                                    Text("Population: ")
                                        .bold()
                                    Text(item.population.description)
                                }
                                
                                HStack {
                                    Text("Country: ")
                                        .bold()
                                    Text(item.nation)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
