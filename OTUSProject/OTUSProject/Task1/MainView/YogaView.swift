//
//  Task1View.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 05.03.2025.
//

import SwiftUI

enum Tabs {
    case aboutAsanas
    case asanas
    case aboutYoga
}

struct YogaView: View {
    @StateObject var viewModel = ViewModelIndexes()
    
    var body: some View {
        VStack() {
            TabView(selection: $viewModel.selectedTabIndex) {
                AboutAsanasView(viewModel: viewModel)
                    .tag(Tabs.aboutAsanas)
                    .tabItem {
                        Label("Об асанах", systemImage: "figure.yoga")
                    }
                AsanaListView(viewModel: viewModel)
                    .tag(Tabs.asanas)
                    .tabItem {
                        Label("Асаны", systemImage: "list.number.hi")
                    }
                InfoView()
                    .tag(Tabs.aboutYoga)
                    .tabItem {
                        Label("О йоге", systemImage: "book")
                    }
            }
        }
        .padding()
    }
}

#Preview {
    YogaView()
}
