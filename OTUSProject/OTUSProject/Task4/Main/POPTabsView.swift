//
//  POPTabsView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import SwiftUI

struct POPTabsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var appViewModel: POPAppViewModel
    @EnvironmentObject var container: DependencyContainer
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $appViewModel.selectedTab){
                    POPPopulationListView(popDataLoader: container.popDataLoader, userDefaultsManager: container.popUserDefaultsManager)
                        .tabItem{
                            Label("Populations", systemImage: "person.3.fill")
                        }
                        .tag(POPTabType.list)
                    
                    POPFavoriteListView(popDataLoader: container.popDataLoader, userDefaultsManager: container.popUserDefaultsManager)
                        .tabItem{
                            Label("Favorites", systemImage: "star.fill")
                        }
                        .tag(POPTabType.favorites)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Populations")
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
