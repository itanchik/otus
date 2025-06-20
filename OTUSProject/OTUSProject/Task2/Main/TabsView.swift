//
//  TabsView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import SwiftUI

struct TabsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var appViewModel: AppViewModel
    @EnvironmentObject var container: DependencyContainer
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $appViewModel.selectedTab){
                    ProductListView(dataLoader: container.dataLoader, userDefaultsManager: container.userDefaultsManager)
                        .tabItem{
                            Label("Products", systemImage: "theatermask.and.paintbrush.fill")
                        }
                        .tag(TabType.list)
                    
                    FavoriteListView(dataLoader: container.dataLoader, userDefaultsManager: container.userDefaultsManager)
                        .tabItem{
                            Label("Favorites", systemImage: "star.fill")
                        }
                        .tag(TabType.favorites)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("MakeApp")
                            .font(
                                .subheadline
                                    .bold()
                            )
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }
            .padding()
        }
    }
}
