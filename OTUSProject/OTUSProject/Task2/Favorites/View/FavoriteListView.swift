//
//  FavoriteListView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import SwiftUI

struct FavoriteListView: View {
    @StateObject private var viewModel: FavoriteListViewModel
    
    init(
        dataLoader: DataLoader,
        userDefaultsManager: UserDefaultsManagerProtocol
    ) {
        _viewModel = StateObject(wrappedValue: FavoriteListViewModel(
            dataLoader: dataLoader,
            userDefaultsManager: userDefaultsManager
        ))
    }
    
    var body: some View {
        Group {
            if viewModel.favorites.isEmpty {
                Text("No Favorites")
            } else {
                List {
                    ForEach(viewModel.favorites) { product in
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
                        }
                    }
                }
            }
        }
    }
}
