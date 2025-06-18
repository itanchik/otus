//
//  AsanasView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 05.03.2025.
//

import SwiftUI

struct AsanaListView: View {
    @StateObject private var asanaListViewModel = AsanaListViewModel()
    @State var viewModel: ViewModelIndexes
    @State private var path = NavigationPath()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(asanaListViewModel.asanas.filter{$0.name.hasPrefix(searchText) || searchText == ""}, id: \.self) { asana in
                    NavigationLink(asana.name, value: asana)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Асаны")
            .navigationDestination(for: AsanaModel.self) { asana in
                AsanaView(imageName: asana.image)
            }
            .onAppear {
                if let asana = asanaListViewModel.asanas.first(where: {$0.id == viewModel.selectedCellIndex}) {
                    path.append(asana)
                }
            }
            .onDisappear{
                viewModel.selectedCellIndex = nil
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    AsanaListView(viewModel: ViewModelIndexes())
}
