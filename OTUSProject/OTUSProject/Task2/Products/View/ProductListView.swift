//
//  ProductListView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel: ProductListViewModel
    
    private let dataLoader: DataLoader
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    init(
        dataLoader: DataLoader,
        userDefaultsManager: UserDefaultsManagerProtocol
    ) {
        _viewModel = StateObject(wrappedValue: ProductListViewModel(
            dataLoader: dataLoader,
            userDefaultsManager: userDefaultsManager
        ))
        self.dataLoader = dataLoader
        self.userDefaultsManager = userDefaultsManager
    }
    
    var body: some View {
        if dataLoader.isLoading {
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
        } else {
            List {
                ForEach(viewModel.productList) { product in
                    HStack(alignment: .center){
                        AsyncImage(url: URL(string: product.image_link)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            PlaceholderView()
                        }
                        .frame(width: 44, height: 44)
                        .background(Color.gray)
                        .cornerRadius(8)
                        
                        Text(product.name)
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: viewModel.favoriteIDs.contains(product.id) ? "star.fill" : "star")
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .trailing
                            )
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                viewModel.toggleFavorite(for: product)
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
