//
//  POPPopulationListView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import SwiftUI

struct POPPopulationListView: View {
    @StateObject private var viewModel: POPPopulationListViewModel
    
    private let popDataLoader: POPDataLoader
    private let userDefaultsManager: POPUserDefaultsManagerProtocol
    
    init(
        popDataLoader: POPDataLoader,
        userDefaultsManager: POPUserDefaultsManagerProtocol
    ) {
        _viewModel = StateObject(wrappedValue: POPPopulationListViewModel(
            popDataLoader: popDataLoader,
            userDefaultsManager: userDefaultsManager
        ))
        self.popDataLoader = popDataLoader
        self.userDefaultsManager = userDefaultsManager
    }
    
    var body: some View {
        if popDataLoader.isLoading {
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
        } else {
            List {
                ForEach(viewModel.populationList) { item in
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
                        Spacer()
                        
                        Image(systemName: viewModel.favoriteIDs.contains(item.id) ? "star.fill" : "star")
                            .frame(
                                alignment: .trailing
                            )
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                viewModel.toggleFavorite(for: item.id)
                            }
                    }
                }
            }
            .onAppear {
                viewModel.favoriteIDs = userDefaultsManager.getFavoriteIDs()
            }
        }
    }
}
